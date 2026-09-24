# Change Set Playbook

Um fluxo simples para desenvolver features e corrigir bugs com agentes de IA a partir de uma issue.

## Princípio

Uma Change Set é o conjunto rastreável formado por:

```text
issue → implementação → testes → documentação funcional → commit → push → PR → integração → encerramento
```

A issue é a especificação inicial. Ela pode estar em um gerenciador externo, em `.change-set/issues/` dentro do projeto ou ser fornecida integralmente no comando. O agente investiga, planeja, implementa e valida na mesma sessão, mantendo o contexto vivo. Documentos adicionais só são criados quando registram o comportamento atual do sistema ou uma decisão que precisa sobreviver à mudança.

## Fluxo diário

1. Escreva uma issue com problema, resultado esperado e, quando necessário, fora de escopo.
2. Inicie o agente com a issue e o prompt instalado em `.change-set/prompts/implement-issue.md`.
3. O agente investiga o código e os testes, apresenta um plano curto e implementa na mesma sessão.
4. O agente executa validações proporcionais à mudança.
5. Se o comportamento do sistema mudou, atualiza o documento correspondente em `docs/features/`.
6. Quando a implementação estiver pronta, invoque `.change-set/prompts/finalize-issue.md` para criar ou atualizar a PR, fazer commit e push.
7. Após a integração da PR, invoque novamente `.change-set/prompts/finalize-issue.md` para encerrar as issues, remover a worktree e atualizar a `main`.

O agente interrompe o trabalho apenas quando encontra comportamento realmente ambíguo, decisão de produto ausente, risco relevante para dados, segurança, dinheiro ou contrato externo, ou uma ação irreversível sem autorização.

## Artefatos

| Artefato | Finalidade |
|---|---|
| Issue | Problema e resultado esperado; pode ser externa, local ou fornecida no comando. |
| Plano da sessão | Roteiro curto e descartável para implementar a issue. |
| `docs/features/<funcionalidade>.md` | Estado atual e evolução da funcionalidade. |
| Pull request | Resumo da mudança, validações e revisão. |
| Commit | Registro permanente da alteração. |

Não são exigidos documentos separados de planning, specification ou review.

## Estrutura

```text
docs/features/       documentação canônica das funcionalidades
.change-set/         kit isolado: guias, método, prompts, modelos e issues locais
scripts/             instalação e atualização do kit em outros projetos
templates/           modelos mínimos de issue, PR e funcionalidade
examples/            exemplo completo e fictício
```

Em `docs/features/`, organize documentos por domínio funcional, não por issue. O agente deve atualizar um arquivo existente antes de criar outro.

## Arquivos para adotar no projeto

Copie para a codebase do projeto consumidor somente o kit operacional:

```text
templates/agents.md → AGENTS.md
docs/features/README.md
.change-set/guides/documentation-maintenance.md
.change-set/methodology/change-set.md
.change-set/prompts/implement-issue.md
.change-set/prompts/finalize-issue.md
.change-set/prompts/migrate-sprint-to-change-set.md
.change-set/templates/feature.md
.change-set/templates/issue.md
.change-set/templates/pull-request.md
```

O diretório `.change-set/issues/` é necessário apenas quando a própria codebase armazenar as solicitações. O `AGENTS.md` da raiz, o README, o changelog e os exemplos deste repositório não fazem parte do kit.

Veja as responsabilidades de cada arquivo e os cuidados de adaptação no [guia de adoção](docs/guides/project-adoption.md).

Para instalar ou atualizar o kit automaticamente:

```bash
./scripts/setup-project.sh /caminho/do/projeto
```

Use `--dry-run` para simular, `--with-local-issues` para criar `.change-set/issues/` e `--migrate-legacy` para migrar instalações anteriores com segurança.

## Começar

1. Execute o script de setup ou copie o kit operacional e transforme [templates/agents.md](templates/agents.md) no `AGENTS.md` do projeto.
2. Adote os modelos de issue e pull request em `.change-set/templates/`; use `.change-set/issues/` apenas sem um gerenciador externo.
3. Crie a documentação das funcionalidades gradualmente com `.change-set/templates/feature.md`.
4. Use `.change-set/prompts/implement-issue.md` para executar cada mudança e `.change-set/prompts/finalize-issue.md` para publicar e encerrar o ciclo.

Se o projeto ainda usar o modelo Sprint, faça a adaptação inicial com `.change-set/prompts/migrate-sprint-to-change-set.md`.

Consulte o [guia de adoção](docs/guides/project-adoption.md) para aplicar o fluxo em outro projeto.

## Licença

Este material está licenciado sob [Creative Commons Attribution 4.0 International](LICENSE) (CC BY 4.0).
