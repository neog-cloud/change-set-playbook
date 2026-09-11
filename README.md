# Change Set Playbook

Um fluxo simples para desenvolver features e corrigir bugs com agentes de IA a partir de uma issue.

## Princípio

Uma Change Set é o conjunto rastreável formado por:

```text
issue → implementação → testes → documentação funcional → PR → commit
```

A issue é a especificação inicial. Ela pode estar em um gerenciador externo, em `issues/` dentro do projeto ou ser fornecida integralmente no comando. O agente investiga, planeja, implementa e valida na mesma sessão, mantendo o contexto vivo. Documentos adicionais só são criados quando registram o comportamento atual do sistema ou uma decisão que precisa sobreviver à mudança.

## Fluxo diário

1. Escreva uma issue com problema, resultado esperado e, quando necessário, fora de escopo.
2. Inicie o agente com a issue e o prompt [implement-issue.md](prompts/implement-issue.md).
3. O agente investiga o código e os testes, apresenta um plano curto e implementa na mesma sessão.
4. O agente executa validações proporcionais à mudança.
5. Se o comportamento do sistema mudou, atualiza o documento correspondente em `docs/features/`.
6. A revisão acontece sobre a issue, o diff, os testes e a documentação atualizada no PR.

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
docs/guides/         adoção e manutenção do playbook
docs/methodology/    definição do método
issues/              issues locais, quando não houver gerenciador externo
prompts/             prompt operacional único
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
docs/guides/documentation-maintenance.md
docs/methodology/change-set.md
prompts/implement-issue.md
templates/feature.md
templates/issue.md
templates/pull-request.md
```

O diretório `issues/` é necessário apenas quando a própria codebase armazenar as solicitações. O `AGENTS.md` da raiz, o README, o changelog e os exemplos deste repositório não fazem parte do kit.

Veja as responsabilidades de cada arquivo e os cuidados de adaptação no [guia de adoção](docs/guides/project-adoption.md).

Para instalar ou atualizar o kit automaticamente:

```bash
./scripts/setup-project.sh /caminho/do/projeto
```

Use `--dry-run` para simular e `--with-local-issues` para criar o diretório opcional `issues/`.

## Começar

1. Execute o script de setup ou copie o kit operacional e transforme [templates/agents.md](templates/agents.md) no `AGENTS.md` do projeto.
2. Adote o [modelo de issue](templates/issue.md) no gerenciador externo ou em `issues/`, e o [modelo de pull request](templates/pull-request.md) quando houver PR.
3. Crie a documentação das funcionalidades gradualmente com o [modelo de funcionalidade](templates/feature.md).
4. Use o [prompt de implementação](prompts/implement-issue.md) para executar cada mudança.

Consulte o [guia de adoção](docs/guides/project-adoption.md) para aplicar o fluxo em outro projeto.

## Licença

Este material está licenciado sob [Creative Commons Attribution 4.0 International](LICENSE) (CC BY 4.0).
