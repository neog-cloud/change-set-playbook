#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly PLAYBOOK_DIR="$(CDPATH= cd -- "${SCRIPT_DIR}/.." && pwd)"
readonly BLOCK_START='<!-- change-set-playbook:start -->'
readonly BLOCK_END='<!-- change-set-playbook:end -->'

DRY_RUN=false
WITH_LOCAL_ISSUES=false
MIGRATE_LEGACY=false
TARGET_INPUT=''
BACKUP_DIR=''
CREATED=0
UPDATED=0
UNCHANGED=0

usage() {
  cat <<'EOF'
Uso:
  scripts/setup-project.sh [--dry-run] [--with-local-issues] [--migrate-legacy] DIRETORIO_DO_PROJETO

Opções:
  --dry-run            Mostra as alterações sem modificar o projeto.
  --with-local-issues  Cria .change-set/issues/ para solicitações locais.
  --migrate-legacy     Move arquivos do layout anterior para .change-set/. Use
                       somente para uma instalação anterior do playbook.
  -h, --help           Exibe esta ajuda.

O script pode ser executado novamente para atualizar o kit. Arquivos alterados são
copiados para .change-set-playbook-backups/ antes de serem substituídos. O kit fica
em .change-set/, exceto AGENTS.md e docs/features/. Conteúdo próprio do AGENTS.md
fora do bloco gerenciado é preservado.
EOF
}

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'Erro: %s\n' "$*" >&2
  exit 1
}

while (($# > 0)); do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      ;;
    --with-local-issues)
      WITH_LOCAL_ISSUES=true
      ;;
    --migrate-legacy)
      MIGRATE_LEGACY=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --*)
      fail "opção desconhecida: $1"
      ;;
    *)
      [[ -z "${TARGET_INPUT}" ]] || fail 'informe somente um diretório de projeto'
      TARGET_INPUT="$1"
      ;;
  esac
  shift
done

[[ -n "${TARGET_INPUT}" ]] || {
  usage >&2
  exit 2
}

[[ -d "${TARGET_INPUT}" ]] || fail "diretório não encontrado: ${TARGET_INPUT}"
[[ -w "${TARGET_INPUT}" ]] || fail "diretório sem permissão de escrita: ${TARGET_INPUT}"

readonly TARGET_DIR="$(CDPATH= cd -- "${TARGET_INPUT}" && pwd)"
[[ "${TARGET_DIR}" != '/' ]] || fail 'o diretório raiz do sistema não pode ser usado como destino'
[[ "${TARGET_DIR}" != "${PLAYBOOK_DIR}" ]] || fail 'o destino não pode ser o próprio repositório do playbook'

readonly -a MANAGED_FILES=(
  'docs/features/README.md:docs/features/README.md'
  'docs/guides/documentation-maintenance.md:.change-set/guides/documentation-maintenance.md'
  'docs/methodology/change-set.md:.change-set/methodology/change-set.md'
  'prompts/implement-issue.md:.change-set/prompts/implement-issue.md'
  'prompts/finalize-issue.md:.change-set/prompts/finalize-issue.md'
  'templates/feature.md:.change-set/templates/feature.md'
  'templates/issue.md:.change-set/templates/issue.md'
  'templates/pull-request.md:.change-set/templates/pull-request.md'
)

readonly -a LEGACY_FILES=(
  'docs/guides/documentation-maintenance.md:.change-set/guides/documentation-maintenance.md'
  'docs/methodology/change-set.md:.change-set/methodology/change-set.md'
  'prompts/implement-issue.md:.change-set/prompts/implement-issue.md'
  'templates/feature.md:.change-set/templates/feature.md'
  'templates/issue.md:.change-set/templates/issue.md'
  'templates/pull-request.md:.change-set/templates/pull-request.md'
)

ensure_backup_dir() {
  if [[ -z "${BACKUP_DIR}" ]]; then
    BACKUP_DIR="${TARGET_DIR}/.change-set-playbook-backups/$(date '+%Y%m%d_%H%M%S')_$$"
    mkdir -p -- "${BACKUP_DIR}"
  fi
}

backup_file() {
  local relative_path="$1"
  local destination="${TARGET_DIR}/${relative_path}"

  ensure_backup_dir
  mkdir -p -- "${BACKUP_DIR}/$(dirname -- "${relative_path}")"
  cp -p -- "${destination}" "${BACKUP_DIR}/${relative_path}"
}

install_managed_file() {
  local source_path="$1"
  local destination_path="$2"
  local source="${PLAYBOOK_DIR}/${source_path}"
  local destination="${TARGET_DIR}/${destination_path}"

  [[ -f "${source}" ]] || fail "arquivo do playbook não encontrado: ${source}"
  [[ ! -L "${destination}" ]] || fail "link simbólico não será substituído: ${destination}"

  if [[ -f "${destination}" ]] && cmp -s -- "${source}" "${destination}"; then
    log "inalterado  ${destination_path}"
    ((UNCHANGED += 1))
    return
  fi

  if [[ -e "${destination}" && ! -f "${destination}" ]]; then
    fail "o destino existe e não é um arquivo regular: ${destination}"
  fi

  if [[ -f "${destination}" ]]; then
    log "atualizar    ${destination_path}"
    if [[ "${DRY_RUN}" == false ]]; then
      backup_file "${destination_path}"
      install -D -m 0644 -- "${source}" "${destination}"
    fi
    ((UPDATED += 1))
  else
    log "criar        ${destination_path}"
    if [[ "${DRY_RUN}" == false ]]; then
      install -D -m 0644 -- "${source}" "${destination}"
    fi
    ((CREATED += 1))
  fi
}

migrate_legacy_files() {
  local mapping
  local legacy_path
  local destination_path
  local legacy
  local destination

  for mapping in "${LEGACY_FILES[@]}"; do
    legacy_path="${mapping%%:*}"
    destination_path="${mapping#*:}"
    legacy="${TARGET_DIR}/${legacy_path}"
    destination="${TARGET_DIR}/${destination_path}"

    [[ -e "${legacy}" || -L "${legacy}" ]] || continue
    [[ ! -L "${legacy}" && -f "${legacy}" ]] || fail "arquivo legado inválido: ${legacy_path}"
    if [[ -e "${destination}" || -L "${destination}" ]]; then
      [[ ! -L "${destination}" && -f "${destination}" ]] || fail "destino de migração inválido: ${destination_path}"
      cmp -s -- "${legacy}" "${destination}" || fail "conflito entre ${legacy_path} e ${destination_path}"
      log "remover legado  ${legacy_path} (já migrado)"
      [[ "${DRY_RUN}" == true ]] || rm -- "${legacy}"
    else
      log "migrar       ${legacy_path} -> ${destination_path}"
      if [[ "${DRY_RUN}" == false ]]; then
        mkdir -p -- "$(dirname -- "${destination}")"
        mv -- "${legacy}" "${destination}"
      fi
    fi
  done
}

render_agents_file() {
  local destination="$1"
  local output="$2"
  local source="${PLAYBOOK_DIR}/templates/agents.md"
  local input='/dev/null'
  local start_count=0
  local end_count=0
  local source_start_count
  local source_end_count

  [[ -f "${source}" ]] || fail "modelo de agentes não encontrado: ${source}"
  source_start_count="$(grep -Fxc -- "${BLOCK_START}" "${source}" || true)"
  source_end_count="$(grep -Fxc -- "${BLOCK_END}" "${source}" || true)"
  if [[ "${source_start_count}" -ne 1 || "${source_end_count}" -ne 1 ]]; then
    fail "o modelo ${source} deve conter exatamente um bloco gerenciado"
  fi

  if [[ -f "${destination}" ]]; then
    input="${destination}"
    start_count="$(grep -Fxc -- "${BLOCK_START}" "${destination}" || true)"
    end_count="$(grep -Fxc -- "${BLOCK_END}" "${destination}" || true)"
    if [[ "${start_count}" -ne "${end_count}" || "${start_count}" -gt 1 ]]; then
      fail "marcadores inválidos em ${destination}; corrija o bloco do change-set-playbook"
    fi
  fi

  awk -v start="${BLOCK_START}" -v end="${BLOCK_END}" -v source="${source}" '
    function emit_source(line, source_inside) {
      while ((getline line < source) > 0) {
        if (line == start) {
          source_inside = 1
          continue
        }
        if (line == end) break
        if (source_inside) print line
      }
      close(source)
    }
    $0 == start {
      print start
      emit_source()
      inside = 1
      found = 1
      next
    }
    $0 == end && inside {
      print end
      inside = 0
      next
    }
    !inside { print }
    END {
      if (!found) {
        if (NR > 0) print ""
        print start
        emit_source()
        print end
      }
    }
  ' "${input}" > "${output}"
}

install_agents_file() {
  local relative_path='AGENTS.md'
  local destination="${TARGET_DIR}/${relative_path}"
  local temporary

  [[ ! -L "${destination}" ]] || fail "link simbólico não será substituído: ${destination}"
  [[ ! -e "${destination}" || -f "${destination}" ]] || fail "o destino existe e não é um arquivo regular: ${destination}"

  temporary="$(mktemp)"
  if [[ ! -s "${destination}" ]]; then
    cp -- "${PLAYBOOK_DIR}/templates/agents.md" "${temporary}"
  else
    if ! render_agents_file "${destination}" "${temporary}"; then
      rm -f -- "${temporary}"
      return 1
    fi
  fi

  if [[ -f "${destination}" ]] && cmp -s -- "${temporary}" "${destination}"; then
    log "inalterado  ${relative_path}"
    ((UNCHANGED += 1))
    rm -f -- "${temporary}"
    return
  fi

  if [[ -f "${destination}" ]]; then
    log "atualizar    ${relative_path} (bloco gerenciado)"
    if [[ "${DRY_RUN}" == false ]]; then
      backup_file "${relative_path}"
      install -m 0644 -- "${temporary}" "${destination}"
    fi
    ((UPDATED += 1))
  else
    log "criar        ${relative_path}"
    if [[ "${DRY_RUN}" == false ]]; then
      install -m 0644 -- "${temporary}" "${destination}"
    fi
    ((CREATED += 1))
  fi
  rm -f -- "${temporary}"
}

log "Projeto: ${TARGET_DIR}"
[[ "${DRY_RUN}" == false ]] || log 'Modo: simulação'

install_agents_file
if [[ "${MIGRATE_LEGACY}" == true ]]; then
  migrate_legacy_files
fi
for mapping in "${MANAGED_FILES[@]}"; do
  install_managed_file "${mapping%%:*}" "${mapping#*:}"
done

if [[ "${WITH_LOCAL_ISSUES}" == true ]]; then
  if [[ -d "${TARGET_DIR}/.change-set/issues" ]]; then
    log 'inalterado  .change-set/issues/'
  else
    log 'criar        .change-set/issues/'
    [[ "${DRY_RUN}" == true ]] || mkdir -p -- "${TARGET_DIR}/.change-set/issues"
  fi
fi

log ''
log "Concluído: ${CREATED} criado(s), ${UPDATED} atualizado(s), ${UNCHANGED} inalterado(s)."
if [[ -n "${BACKUP_DIR}" ]]; then
  log "Backup: ${BACKUP_DIR}"
fi
