# Convenção de nomes

## IDs

Use `CS-001` a `CS-999`. Após alcançar `CS-999`, continue com `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99` e assim sucessivamente.

## Sub-Change Sets

Use Sub-Change Sets apenas quando o subitem tiver implementação e revisão próprias. O formato é:

```text
CS-[ID-PRINCIPAL]-[SUBITEM]
```

O sufixo do subitem tem dois dígitos e preserva o identificador histórico quando ele existir:

| Identificador anterior | Identificador novo |
|---|---|
| `Sprint 04.5` | `CS-004-05` |
| `Sprint 04.6` | `CS-004-06` |
| `Sprint 12.10` | `CS-012-10` |
| Subitem de `CS-A01` | `CS-A01-05` |

Não reutilize o sufixo dentro do mesmo item principal. Um identificador com mais de uma subdivisão decimal, como `Sprint 04.5.1`, exige decisão manual.

## Caminhos recomendados no projeto-alvo

```text
docs/change-sets/
├── index.md
├── cs-001/
    ├── planning-aviso_manutencao_programada.md
    ├── specification-aviso_manutencao_programada.md
    └── review-aviso_manutencao_programada.md
└── cs-004-05/
    ├── planning-importacao_clientes.md
    ├── specification-importacao_clientes.md
    └── review-importacao_clientes.md
```

Nomes de arquivos e diretórios não podem conter espaços. Os artefatos de uma Change Set usam `planning-<titulo>.md`, `specification-<titulo>.md`, `review-<titulo>.md` e `post-change-set-<titulo>.md`. Substitua `<titulo>` por um slug em minúsculas e use `_` entre as palavras, como em `specification-aviso_manutencao_programada.md`. Um relatório intermediário da revisão da especificação pode usar `review-specification-<titulo>.md`. Não transforme títulos visíveis, como `Change Set CS-001`, em nomes de arquivo.

Nomes de diretório usam minúsculas. Nomes visíveis usam `Change Set CS-001` ou `Sub-Change Set CS-004-05`.
