# Change Set

Uma Change Set é a unidade de trabalho deste playbook. Ela não é uma Sprint Scrum e não pressupõe duração fixa, cerimônias Scrum ou uma única sessão de IA.

Uma Change Set separa três conceitos:

- **Change Set:** unidade rastreável de mudança de engenharia.
- **Sessão:** uma interação com um agente ou modelo.
- **Commit:** registro de uma alteração no Git.

O objetivo é que cada mudança tenha contexto, critérios verificáveis, implementação controlada, revisão independente e registro final confiável.

## Sub-Change Sets

Quando uma subdivisão de uma Change Set teve planejamento, implementação e revisão próprios, ela é uma **Sub-Change Set**. Ela recebe o ID do item principal seguido de um sufixo de dois dígitos: `CS-004-05` e `CS-004-06` são Sub-Change Sets de `CS-004`.

Uma subtarefa sem ciclo próprio de implementação e revisão não recebe um ID de Sub-Change Set; ela permanece como item do planejamento ou da especificação do item principal.
