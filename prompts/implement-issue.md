# Prompt — Implementar uma issue

## Entrada

```text
Issue: [NÚMERO, LINK, CAMINHO LOCAL OU CONTEÚDO COMPLETO]

Contexto adicional: [CAMINHOS, LINKS OU “NENHUM”]
```

## Prompt

Implemente a issue informada até obter um resultado validado e pronto para revisão.

Leia o `AGENTS.md` do projeto e a issue. Não leia o README, todos os guias ou todos os modelos por padrão; abra apenas arquivos necessários para entender e executar a mudança.

### Trabalho

1. Localize o comportamento atual, os testes relacionados e as convenções da área afetada.
2. Apresente um plano curto de três a seis passos dentro da sessão.
3. Implemente o resultado esperado sem ampliar o escopo da issue.
4. Execute primeiro os testes focais; rode lint, build ou suíte mais ampla quando forem aplicáveis ao impacto da mudança.
5. Corrija falhas causadas pela alteração e revise o diff final.
6. Se o comportamento funcional mudou, procure e atualize o documento correspondente em `docs/features/`. Crie um documento somente quando nenhum existente representar a funcionalidade e registre a issue ou PR na seção “Evolução”.

Ao terminar esta sessão, deixe a implementação validada e o diff pronto para revisão. A criação da PR, o commit, o push e o encerramento do ciclo são tarefas do prompt separado [finalize-issue.md](finalize-issue.md). Não tente encerrar a issue, remover a worktree ou atualizar a `main` nesta etapa.

Atualize o plano durante a execução quando o código revelar uma premissa incorreta. Não crie documentos intermediários para registrar o plano.

### Organização da documentação

- Use `docs/features/` para documentar o comportamento atual das funcionalidades.
- Antes de criar um arquivo, procure a documentação existente da mesma funcionalidade e atualize-a.
- Não crie um documento por issue; organize os arquivos por domínio funcional, como `autenticacao.md`, `faturamento.md` ou `notificacoes.md`.
- Ao criar uma funcionalidade nova, use `.change-set/templates/feature.md`.
- Use nomes em minúsculas, sem espaços e com `_` entre as palavras.
- Use `.change-set/guides/` somente para instruções operacionais destinadas a pessoas.
- Use `.change-set/methodology/` somente para métodos e convenções de engenharia.
- Registre a issue ou o PR na seção “Evolução” do documento funcional.

### Quando pedir direção

Pare e peça uma decisão apenas se encontrar:

- comportamento esperado materialmente ambíguo;
- decisão de produto ou negócio ausente;
- risco relevante para dados, segurança, dinheiro ou contrato externo;
- ação irreversível sem autorização.

Antes de perguntar, conclua toda investigação segura que puder tornar a decisão concreta. Resolva decisões técnicas rotineiras pelas convenções, pelo código e pelos testes existentes.

### Limites

- Preserve alterações preexistentes não relacionadas.
- Não faça commit, push, merge ou publicação sem solicitação explícita.
- Não declare que um teste passou sem executá-lo.
- Não trate resumo verbal como substituto do diff ou dos resultados de validação.

### Entrega

Ao concluir, informe:

- resultado implementado;
- arquivos alterados;
- comandos executados e resultados;
- documentação funcional criada ou atualizada, ou por que não se aplica;
- pendências ou riscos residuais.
