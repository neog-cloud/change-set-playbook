# Prompt — Finalizar uma issue implementada

## Entrada

```text
Issue: [NÚMERO, LINK, CAMINHO LOCAL OU CONTEÚDO COMPLETO]

PR: [NÚMERO, LINK OU “AINDA NÃO CRIADA”]

Contexto adicional: [CAMINHOS, LINKS OU “NENHUM”]
```

## Prompt

Finalize uma implementação que já passou por `implement-issue.md`. Faça a entrega completa e siga as etapas abaixo na ordem. Não considere a tarefa concluída enquanto o commit não estiver no remoto e, quando aplicável, a `main` não tiver sido atualizada.

Leia o `AGENTS.md`, a issue e a PR, quando houver. Inspecione somente a worktree e os arquivos relacionados à mudança. Não reimplemente a issue sem evidência de que a implementação está incompleta.

### 1. Conferência da entrega

1. Confirme o repositório, a worktree, a branch, a issue e a PR corretos.
2. Confira `git status`, os commits da branch e o diff em relação à base da PR.
3. Preserve alterações preexistentes não relacionadas. Pare se houver alterações não atribuídas, uma branch incorreta, uma issue ou PR não identificada, ou qualquer outra ambiguidade material.
4. Execute as validações necessárias para confirmar que a implementação está pronta. No mínimo, execute `git diff --check` e repita os testes focais quando não houver evidência confiável de que continuam válidos.
5. Se a implementação ainda não estiver pronta, retome o fluxo de [implement-issue.md](implement-issue.md), corrija o problema e só então volte a este prompt.

### 2. Registro e publicação da implementação

1. Verifique se já existe um commit que contenha toda a implementação validada. Se não existir, faça um único commit com apenas os arquivos intencionais e inclua a referência da issue na mensagem.
2. Não crie um commit vazio nem um commit duplicado. Se houver mudanças locais depois de um commit válido, revise-as, valide-as e faça um novo commit somente se forem parte da issue.
3. Publique a branch no remoto (`git push`) e confirme que o commit publicado corresponde ao commit validado localmente. Não pare depois de criar apenas um commit local.
4. Se a PR ainda não existir, crie-a contra a branch principal do projeto. Se já existir, confirme que aponta para a branch publicada e atualize sua descrição com o resumo da mudança, os testes executados e a documentação funcional afetada.
5. Relacione a PR à issue sem fechar a issue antes da integração. Informe o link da PR e o hash do commit publicado.

Depois de criar ou atualizar uma PR ainda aberta, encerre esta execução nessa etapa e informe que falta aprovação e integração. Não feche uma PR não integrada apenas para simular a conclusão.

### 3. Encerramento após a integração

Execute esta etapa somente quando o estado remoto confirmar que a PR foi integrada. Uma aprovação sem merge não é suficiente.

1. Confira novamente o estado da PR e confirme o merge, a branch de destino e o commit integrado.
2. Verifique se não há pendências nem outra PR aberta vinculada à issue. Só então encerre as issues envolvidas, quando o gerenciador e o fluxo do projeto permitirem.
3. Confirme que o commit integrado está publicado e que não há commit da implementação restrito ao ambiente local. Preserve a worktree e as branches para consulta futura; não atualize a branch principal nem remova worktrees ou branches neste fluxo.
4. Informe que, se o desenvolvedor quiser atualizar a branch principal e limpar a worktree e as branches, pode executar [cleanup-merged-issue.md](cleanup-merged-issue.md) separadamente a partir da worktree principal, com a branch principal ativa.

### Regras de segurança

- A invocação explícita deste prompt autoriza o commit e o push da implementação descrita na entrada, mas não autoriza incluir alterações preexistentes ou não relacionadas.
- Uma PR integrada deve ser considerada encerrada pelo fluxo de merge; não feche manualmente uma PR aberta para simular a integração.
- Não faça merge, feche uma PR não integrada, atualize a branch principal, remova worktrees ou branches, force push ou descarte alterações.
- Diante de falha de teste, divergência entre issue, PR e branch, conflito, permissão ausente ou estado remoto inesperado, pare na etapa atual e informe a pendência concreta.

### Entrega

Ao concluir, informe:

- issue e PR processadas;
- commit criado ou confirmado e evidência de que foi publicado;
- validações executadas e resultados;
- estado da PR e das issues;
- worktree e branches preservadas para consulta futura;
- pendências ou riscos residuais, incluindo a opção de executar `cleanup-merged-issue.md` separadamente.
