# Change Set

Uma Change Set é a unidade de trabalho deste playbook. Ela não é uma Sprint Scrum e não pressupõe duração fixa, cerimônias Scrum ou uma única sessão de IA.

Uma Change Set separa três conceitos:

- **Change Set:** unidade rastreável de mudança de engenharia.
- **Sessão:** uma interação com um agente ou modelo.
- **Commit:** registro de uma alteração no Git.

O objetivo é que cada mudança tenha contexto, critérios verificáveis, implementação controlada, revisão independente e registro final confiável.

## Descoberta e planejamento

Antes da especificação, registre o contexto em `planning.md`. Esse documento consolida o problema, o valor esperado, o caso de uso, contribuições de áreas distintas, decisões, dúvidas e riscos em linguagem acessível para pessoas técnicas e não técnicas.

O planejamento orienta a especificação, mas não substitui seus elementos técnicos nem autoriza a implementação. A especificação deve traduzir os alinhamentos relevantes em escopo, contratos, checklist de implementação, critérios de aceite e validações.

## Checklist de implementação

A especificação deve manter um checklist de unidades de trabalho pequenas e concretas. Ele serve como roteiro de implementação e permite acompanhar quais partes do escopo já foram concluídas e validadas. O checklist não substitui os critérios de aceite: os itens descrevem o trabalho a realizar, enquanto os critérios comprovam o resultado observável.

Quando um item do checklist exigir planejamento, implementação e revisão próprios, ele deve se tornar uma Sub-Change Set. Itens sem ciclo próprio permanecem na especificação da Change Set principal.

## Sub-Change Sets

Quando uma subdivisão de uma Change Set teve planejamento, implementação e revisão próprios, ela é uma **Sub-Change Set**. Ela recebe o ID do item principal seguido de um sufixo de dois dígitos: `CS-004-05` e `CS-004-06` são Sub-Change Sets de `CS-004`.

Uma subtarefa sem ciclo próprio de implementação e revisão não recebe um ID de Sub-Change Set; ela permanece como item do planejamento ou da especificação do item principal.
