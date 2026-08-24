# Instruções para agentes

Este repositório contém documentação e modelos reutilizáveis; não contém uma aplicação de produção.

- Leia o `README.md` e o arquivo alvo antes de editar.
- Preserve a convenção de IDs: `CS-001` a `CS-999`, depois `CS-A01` a `CS-A99`, `CS-B01` e assim sucessivamente.
- Use `CS-[ID-PRINCIPAL]-[SUBITEM]`, como `CS-004-05`, somente para Sub-Change Sets com implementação e revisão próprias.
- Mantenha o fluxo dos artefatos: `planning-<titulo>.md` consolida descoberta e alinhamento; `specification-<titulo>.md` traduz o planejamento em escopo técnico; `review-<titulo>.md` registra a auditoria independente. O planejamento não autoriza implementação por si só.
- Não crie arquivos ou diretórios com espaços no nome; use nomes técnicos em minúsculas e substitua espaços por `_`.
- Não altere exemplos, modelos ou prompts sem atualizar links e `CHANGELOG.md` quando aplicável.
- Mantenha português do Brasil e placeholders genéricos.
- Antes de concluir, valide links relativos e execute `git diff --check`.
- Não faça commit sem solicitação explícita.
