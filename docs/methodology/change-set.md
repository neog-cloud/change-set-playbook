# Change Set

Uma Change Set é uma mudança de engenharia rastreada pela issue que a originou. Ela pode conter uma feature, correção, refatoração ou alteração documental e pode resultar em um ou mais commits.

## Fluxo

```text
Issue → investigar → planejar → implementar → validar → documentar → commit/push → PR → integrar → encerrar
```

Investigação, plano, implementação e validação devem permanecer na mesma sessão sempre que possível. Isso reduz perda de contexto e permite que o plano seja corrigido quando o código real revelar uma premissa incorreta.

A implementação e o encerramento da entrega são etapas separadas. `implement-issue.md` deixa a mudança pronta para revisão; `finalize-issue.md` publica o commit e a PR e, somente depois da integração confirmada, encerra as issues, remove a worktree e atualiza a branch principal. Se a PR ainda estiver aberta, o segundo prompt deve parar após publicar a entrega.

## Fonte de verdade por assunto

| Informação | Fonte de verdade |
|---|---|
| Intenção da mudança | Issue |
| Estado atual do sistema | Código e testes |
| Comportamento funcional atual | `docs/features/` |
| Alterações realizadas e validações | Pull request |
| Histórico técnico | Git |

## Quando interromper

O agente deve pedir direção antes de continuar somente quando houver:

- resultado esperado materialmente ambíguo;
- decisão de produto ou negócio ausente;
- risco relevante para dados, segurança, dinheiro ou contrato externo;
- ação irreversível sem autorização.

Uma decisão técnica rotineira deve ser resolvida a partir das convenções, do código e dos testes existentes.

## Revisão

A revisão usa a issue, o diff, os resultados das validações e a documentação funcional atualizada. Achados são registrados no pull request; não há relatório de revisão separado.
