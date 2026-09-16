# Changelog

Todas as mudanças relevantes deste repositório serão registradas neste arquivo.

## [Unreleased]

### Changed

- O fluxo separa a implementação da finalização da entrega, com checkpoints explícitos para commit, push, PR integrada, encerramento das issues, remoção da worktree e atualização da `main`.
- O playbook foi refeito como um fluxo único baseado em issue, implementação, testes, documentação funcional e pull request.
- A issue passou a ser a especificação inicial e a referência primária de rastreabilidade.
- Planejamento, implementação e validação passam a ocorrer na mesma sessão com contexto vivo.
- A documentação permanente passa a representar funcionalidades atuais e sua evolução.
- A organização documental passa a distinguir funcionalidades, guias operacionais e metodologia, evitando um arquivo por issue.
- O guia passa a aceitar issues de gerenciadores externos, arquivos locais em `issues/` ou conteúdo fornecido diretamente ao agente.
- O guia de adoção passa a listar o kit mínimo de arquivos que deve ser copiado para a codebase de cada projeto.

### Added

- Prompt único para implementar uma issue.
- Prompt para finalizar uma issue implementada e publicar ou encerrar a entrega em etapas.
- Modelos mínimos de issue, pull request e documentação funcional.
- Modelo de `AGENTS.md` para instalação no projeto consumidor.
- Script Bash idempotente para instalar e atualizar o kit em um projeto, com simulação e backup.
- Exemplo fictício completo do novo fluxo.

### Removed

- Gates e faixas obrigatórias de triagem.
- Artefatos separados de planning, specification, review e pós-Change Set.
- Matrizes de requisitos e evidências usadas como documentos intermediários.
- Roteamento de modelos específico do processo anterior.
