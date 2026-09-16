# Regras para agentes

<!-- change-set-playbook:start -->

## Change Set Playbook

- Leia a issue e os arquivos diretamente afetados antes de editar.
- Investigue o código e os testes com buscas focais; não releia toda a documentação por padrão.
- Apresente um plano curto na sessão e mantenha a implementação dentro do escopo da issue.
- Execute os testes focais e as demais validações proporcionais ao impacto da mudança.
- Execute comandos rotineiros de leitura e validação com `go` (como `fmt`, `vet` e `test`), `git` (como `diff` e `-C`) e `gh` (como visualizar e criar PRs e issues) sem pedir autorização individual.
- Ao concluir uma rodada de implementação, está autorizado executar `go test ...`, `gh pr create ...`, `gh pr edit ...`, `gh pr list ...`, `gh pr status`, `gh pr checks`, `gh issue close ...`, `git worktree list`, `git -C PATH worktree remove`, `git switch main`, `git pull --ff-only` e `gofmt ...` sem solicitar aprovação adicional.
- A invocação explícita de `.change-set/prompts/finalize-issue.md` constitui solicitação para registrar e publicar a implementação validada, respeitando os checkpoints e limites desse prompt.
- Atualize `docs/features/` quando o comportamento funcional do sistema mudar.
- Antes de criar um documento funcional, procure e atualize o arquivo existente do mesmo domínio.
- Preserve alterações preexistentes não relacionadas.
- Pare somente diante de ambiguidade material, risco relevante ou ação irreversível sem autorização.
- Não faça commit, push, merge ou publicação sem solicitação explícita.
- Mantenha confirmação explícita para exclusões e outras ações externas ou irreversíveis.
- Ao concluir, informe os arquivos alterados, as validações executadas e as pendências.
<!-- change-set-playbook:end -->

## Comandos do projeto

- Testes focais: `[COMANDO OU ORIENTAÇÃO]`
- Testes completos: `[COMANDO OU ORIENTAÇÃO]`
- Lint: `[COMANDO OU “NÃO SE APLICA”]`
- Build: `[COMANDO OU “NÃO SE APLICA”]`
