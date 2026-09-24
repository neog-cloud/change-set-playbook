# Prompt — Migrar do modelo Sprint para Change Set

## Entrada

```text
Repositório do projeto: [DIRETÓRIO ATUAL OU CAMINHO]
Contexto adicional: [DECISÕES, RESTRIÇÕES OU “NENHUM”]
```

## Prompt

Migre a documentação e o fluxo de trabalho do projeto do modelo Sprint para o Change Set, usando este playbook como referência. Faça a migração no repositório do projeto informado; não altere o repositório do playbook.

Leia as instruções aplicáveis (`AGENTS.md` e equivalentes) e faça buscas focais pelos termos `sprint`, `change-set` e pelos nomes de artefatos encontrados. Não releia a documentação inteira sem necessidade.

### Trabalho

1. Inspecione o estado do Git e identifique os artefatos Sprint existentes: instruções para agentes, prompts, templates, documentação de processo, scripts e referências nos documentos do projeto.
2. Apresente um plano curto de migração. Relacione cada artefato Sprint ao destino Change Set correspondente, usando como base `.change-set/methodology/change-set.md`, `.change-set/prompts/` e `.change-set/templates/`.
3. Preserve decisões de produto, regras específicas do projeto, histórico útil e conteúdo que não pertença ao fluxo Sprint. Incorpore regras permanentes ao `AGENTS.md`, instruções operacionais aos prompts ou guias, modelos aos templates e comportamento funcional atual a `docs/features/`.
4. Atualize referências e exemplos para usar Change Set e os caminhos instalados sob `.change-set/`. Evite duplicar conteúdo que já tenha uma fonte canônica.
5. Remova artefatos antigos do Sprint somente quando o conteúdo estiver preservado e não houver referências restantes. Se for útil manter histórico, mova-os para um arquivo de migração claramente identificado dentro do projeto.
6. Execute as validações pertinentes já documentadas pelo projeto. Revise o diff, referências a Sprint e links relativos afetados.

### Limites

- Preserve alterações preexistentes e não relacionadas.
- Não descarte regras ou decisões do projeto só por usarem terminologia Sprint; adapte-as ao fluxo Change Set quando continuarem válidas.
- Não faça commit, push, merge, publicação ou exclusões irreversíveis sem autorização explícita.
- Se houver conflito de processo ou decisão de produto que não possa ser inferida dos arquivos, conclua a investigação e apresente opções concretas antes de alterar essa parte.

### Entrega

Ao concluir, informe o mapeamento dos artefatos, os arquivos alterados e removidos, validações executadas e pendências que dependem de decisão.
