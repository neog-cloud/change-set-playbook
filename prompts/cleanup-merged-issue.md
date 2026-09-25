# Prompt — Atualizar `main` e limpar uma issue integrada

## Entrada

```text
Issue: [NÚMERO, LINK OU “NENHUMA”]

PR integrada: [NÚMERO OU LINK]

Branch da implementação: [NOME]

Worktree da implementação: [CAMINHO]

Remoto: [NOME, normalmente origin]
```

## Prompt

Atualize a branch principal local e limpe os recursos locais e remotos da implementação já integrada. Execute este prompt a partir da worktree principal, com `main` (ou a branch principal configurada no projeto) ativa. Faça as etapas na ordem e pare diante de qualquer condição de segurança não satisfeita.

Leia o `AGENTS.md` e confira o estado do repositório, da PR e das worktrees antes de alterar qualquer coisa. Identifique a branch principal configurada e o remoto correto; não presuma que os nomes informados correspondem ao repositório atual.

### 1. Confirmar contexto e integração

1. Confirme que o diretório atual é a worktree principal deste repositório e que a branch principal está ativa. Se estiver em outra branch ou worktree, pare sem atualizar ou remover nada.
2. Confira `git status` na worktree principal. Ela deve estar limpa; não guarde, descarte nem incorpore alterações locais.
3. Confirme no provedor Git que a PR informada foi integrada à branch principal deste repositório. Uma PR aberta, fechada sem merge ou integrada em outra branch não atende a esta condição.
4. Confirme que a branch da implementação e o caminho da worktree informados pertencem a este repositório e correspondem um ao outro. Proteja a branch principal e qualquer worktree principal contra remoção.
5. Verifique se não há outra PR aberta usando a branch da implementação como origem. Se houver, pare antes de limpar.

### 2. Atualizar a branch principal

1. Atualize as referências do remoto informado (`git fetch` ou equivalente).
2. Atualize a branch principal somente por avanço rápido, usando `git pull --ff-only` ou equivalente. Não faça merge commit, rebase ou reset para contornar divergência.
3. Confirme que a branch local está sincronizada com a branch principal remota e que a worktree principal continua limpa. Se houver divergência, conflito ou mudança inesperada, pare.
4. Confirme que o commit da PR integrada está contido no histórico atualizado da branch principal.

### 3. Remover worktree e branches da implementação

Faça estas verificações antes de cada remoção:

1. Confira `git status` na worktree da implementação, incluindo arquivos não rastreados. Ela deve estar limpa. Se estiver suja, preserve-a e pare antes de removê-la.
2. Confirme que a worktree informada não é a worktree atual nem a principal e que está associada à branch de implementação informada.
3. Confirme que o commit da branch local está contido na branch principal atualizada. Só então remova a worktree com `git worktree remove` sem `--force`.
4. Confirme que a branch local não está em uso por outra worktree e que seu commit está contido na branch principal. Só então remova-a com `git branch -d`, nunca com `-D`.
5. Antes de remover a branch remota, confirme que a referência remota existe, que seu commit está contido na branch principal atualizada e que não há PR aberta usando-a. Só então remova-a explicitamente do remoto informado (por exemplo, `git push <remoto> --delete <branch>`).
6. Se a worktree ou uma branch já não existir, registre isso e continue apenas se as demais verificações puderem ser confirmadas. Não substitua verificações por suposições.

### Regras de segurança

- Esta invocação autoriza atualizar a branch principal por avanço rápido e remover a worktree e as branches local e remota identificadas na entrada, desde que todas as verificações acima passem.
- Não remova outras worktrees ou branches. Não remova branch principal, branch protegida, branch em uso, branch com commits fora da principal atualizada ou branch associada a PR aberta.
- Não force remoções, não descarte alterações e não tente contornar divergências. Em qualquer falha ou estado inesperado, pare antes da ação correspondente e informe o motivo concreto.

### Entrega

Informe:

- PR e commit integrado confirmados;
- branch principal e remoto usados, incluindo o resultado da atualização;
- worktree removida ou preservada e o motivo;
- branches local e remota removidas ou preservadas e o motivo;
- estado final da worktree principal e qualquer pendência.
