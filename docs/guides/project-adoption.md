# Adoção em um projeto

Para o roteiro operacional completo, consulte o [guia de issue a Change Set](workflow-issue-to-change-set.md).

1. Crie `docs/change-sets/index.md` e a pasta da primeira Change Set.
2. Copie os modelos de `templates/change-set/`.
3. Preencha `planning-<titulo>.md` com o problema, caso de uso, contribuições das áreas envolvidas, decisões e dúvidas antes de criar a especificação.
4. Registre requisitos `RQ-*`, comandos ou procedimentos literais de validação, resultados esperados e convenções específicas do projeto na especificação.
5. Faça a revisão pré-implementação em `review-specification-<titulo>.md`; só então marque a especificação como `validada` e implemente.
6. Durante a implementação, preencha a matriz de rastreabilidade com evidências obtidas e resultados de `VT-*`; use sessões independentes para a revisão final.
7. Atualize o índice e a documentação estrutural no pós-Change Set.

Ao criar os arquivos, use `planning-<titulo>.md`, `specification-<titulo>.md`, `review-specification-<titulo>.md`, `review-<titulo>.md` e `post-change-set-<titulo>.md`. Substitua `<titulo>` por um slug em minúsculas, com `_` no lugar de espaços, como `aviso_manutencao_programada`. Mantenha nomes legíveis, como “Relatório de Revisão”, no título do documento.

Quando uma Change Set possuir subitens com implementação e revisão próprias, crie uma pasta independente para cada Sub-Change Set, como `docs/change-sets/cs-004-05/`.

Para um projeto que usa “Sprint”, utilize o prompt em `prompts/migration-sprint-to-change-set.md`.
