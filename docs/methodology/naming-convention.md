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
    ├── planning.md
    ├── specification.md
    └── review-cs-001.md
└── cs-004-05/
    ├── planning.md
    ├── specification.md
    └── review-cs-004-05.md
```

Nomes de arquivos e diretórios não podem conter espaços. Use nomes técnicos em minúsculas e substitua espaços por `_`, como em `relatorio_revisao_cs-001.md`. Não transforme títulos visíveis, como `Change Set CS-001`, em nomes de arquivo.

Nomes de diretório usam minúsculas. Nomes visíveis usam `Change Set CS-001` ou `Sub-Change Set CS-004-05`.
