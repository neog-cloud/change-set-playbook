# Changelog

Todas as mudanças relevantes deste repositório serão registradas neste arquivo.

## [Unreleased]

### Added

- Estrutura inicial do Change Set Playbook.
- Modelos de especificação, revisão e pós-Change Set.
- Prompt de migração de “Sprint” para “Change Set”.
- Guia de roteamento GPT-5.6 Luna, Terra e Sol.
- Checklist de implementação na especificação, para decompor e acompanhar o trabalho da Change Set.
- Modelo `planning-<titulo>.md` para descoberta e alinhamento multidisciplinar antes da especificação.
- Exemplo fictício completo de planejamento, especificação e revisão para `CS-001`.
- Prompt para transformar issues em `planning-<titulo>.md`.
- Prompt para transformar `planning-<titulo>.md` em `specification-<titulo>.md`.
- Prompt para revisar `specification-<titulo>.md` antes da implementação.
- Modelo `review-specification-<titulo>.md` para registrar e decidir o gate independente antes da implementação.
- Matriz de rastreabilidade obrigatória entre requisitos (`RQ-*`), checklist (`CI-*`), critérios de aceite (`CA-*`), validações (`VT-*`) e evidências.
- Guia operacional de issue até Change Set concluída.

### Changed

- Orientação para não usar espaços em nomes de arquivos e diretórios, substituindo-os por `_`.
- Instruções para agentes e contribuidores alinhadas ao fluxo de planejamento, especificação e revisão.
- Convenção de nomes dos artefatos com título normalizado: `planning-<titulo>.md`, `specification-<titulo>.md` e `review-<titulo>.md`.
- Status e gate da especificação: somente uma revisão pré-implementação `APROVADA` autoriza o status `validada`.
