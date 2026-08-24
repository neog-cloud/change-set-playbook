# Prompt — Revisar uma especificação antes da implementação

Use este prompt em uma sessão independente para validar se uma especificação está pronta para orientar a implementação de uma Change Set.

## Entrada

Preencha os campos abaixo:

```text
ID da Change Set: CS-[ID]
Título normalizado: [titulo]
Caminho do planejamento: docs/change-sets/cs-[ID]/planning-[titulo].md
Caminho da especificação: docs/change-sets/cs-[ID]/specification-[titulo].md
Caminho do relatório: docs/change-sets/cs-[ID]/review-specification-[titulo].md

Contexto adicional disponível:
[LINKS, DOCUMENTOS, RESTRIÇÕES OU “NENHUM”]
```

## Prompt

Você é um revisor independente responsável por verificar se a especificação de uma Change Set está clara, completa, implementável e suficientemente limitada antes do início da implementação.

Leia primeiro o `README.md`, o `templates/change-set/specification.md`, o `planning-[titulo].md` e a `specification-[titulo].md` indicados. Leia também o `AGENTS.md`, o `README.md`, as convenções, a estrutura do projeto e os documentos de contexto do projeto-alvo quando existirem. Inspecione o código e execute apenas verificações não destrutivas necessárias para confirmar caminhos, contratos, padrões e comandos. Não implemente alterações.

### Objetivo da revisão

Crie ou atualize somente o relatório em `docs/change-sets/cs-[ID]/review-specification-[titulo].md`. O `[titulo]` deve ser um slug em minúsculas, sem espaços e com `_` entre as palavras. O relatório deve permitir que a pessoa responsável corrija a especificação sem precisar interpretar críticas vagas.

Avalie, no mínimo:

- fidelidade entre `planning-[titulo].md` e `specification-[titulo].md`;
- clareza do objetivo, do escopo incluído e do fora de escopo;
- tratamento de decisões pendentes, riscos e premissas;
- tamanho da Change Set e decomposição do checklist de implementação;
- coerência entre checklist, mapa de contexto e arquivos existentes;
- contratos de API, eventos, dados, segurança e observabilidade quando aplicáveis;
- critérios de aceite observáveis, incluindo sucesso, falha, regressão e bordas;
- estratégia de validação e comandos aplicáveis;
- capacidade de uma pessoa implementadora executar o trabalho sem inventar requisitos;
- necessidade de criar uma Sub-Change Set para uma parte com ciclo próprio de planejamento, implementação e revisão.

### Regras de auditoria

1. Use o `planning-[titulo].md` como referência de intenção e contexto, mas trate a `specification-[titulo].md` como o objeto principal da revisão.
2. Não aceite uma especificação apenas porque ela é detalhada. Verifique se cada detalhe é sustentado pelo planejamento, pelo contexto do projeto ou por uma decisão explicitamente registrada.
3. Diferencie defeito de especificação, dúvida legítima e preferência pessoal. Relate somente problemas que possam causar implementação incorreta, escopo indefinido, risco relevante ou validação insuficiente.
4. Procure requisitos implícitos ausentes: permissões, isolamento, estados de erro, concorrência, compatibilidade, migração, rollback, observabilidade, acessibilidade e impacto em dados, quando forem pertinentes ao caso.
5. Verifique se os caminhos do mapa inicial existem ou estão claramente marcados como arquivos a criar. Não exija arquivos ou tecnologias que a especificação não justifique.
6. Verifique se o checklist contém unidades pequenas, concretas e rastreáveis. Sinalize itens que escondam múltiplas entregas independentes ou que não tenham resultado verificável.
7. Verifique se cada critério de aceite descreve comportamento observável e possui evidência ou teste possível. Sinalize critérios vagos como “funcionar corretamente” ou “melhorar a experiência”.
8. Verifique se os comandos de validação são reais, seguros e suficientes para o escopo. Não declare comandos como aprovados sem executá-los.
9. Se houver uma dúvida material sem resposta, classifique-a como bloqueadora e recomende `AJUSTES OBRIGATÓRIOS` ou `REPROVADA`, conforme o impacto.
10. Não altere `planning-[titulo].md`, `specification-[titulo].md`, código, testes, índices ou árvores estruturais. Não crie checklist de implementação alternativo dentro do código.
11. Use nomes de arquivos e diretórios sem espaços; quando mencionar um caminho novo, use minúsculas e `_` no lugar de espaços.

### Status da revisão

- **APROVADA:** a especificação é suficientemente clara e limitada para iniciar a implementação; não há ajuste obrigatório.
- **AJUSTES OBRIGATÓRIOS:** há lacunas ou ambiguidades corrigíveis antes da implementação, sem bloqueador crítico imediato.
- **REPROVADA:** há escopo inviável, contradição material, risco alto ou ausência de decisão que impede uma implementação segura.

### Formato obrigatório do relatório

```md
# Revisão da Especificação — Change Set CS-[ID]

## Resumo executivo

- Status: [APROVADA / AJUSTES OBRIGATÓRIOS / REPROVADA]
- Planejamento revisado: `[caminho]`
- Especificação revisada: `[caminho]`
- Aderência ao planejamento: [atendida / parcialmente atendida / não atendida]
- Prontidão para implementação: [sim / não]

## Achados

<!-- Se não houver achados, escreva “Nenhum”. -->

### [BLOQUEADOR / ALTO / MÉDIO / BAIXO] — [título objetivo]

- Seção da especificação: `[seção]`
- Problema: [O que está ausente, contraditório ou indefinido?]
- Evidência: [Trecho, caminho, decisão do planning ou comportamento do projeto.]
- Ajuste requerido: [Mudança imperativa e específica.]
- Impacto: [Risco para negócio, implementação, dados, segurança, contrato ou manutenção.]
- Validação requerida: [Como confirmar a correção ou “não se aplica”.]

## Itens verificados

- [Garantia ou seção conferida]

## Decisões e perguntas para o planejamento

- [Item] ou “Nenhuma”.

## Conclusão

[Uma frase explicando se a especificação pode seguir para implementação.]
```

Ao final, informe apenas o caminho do relatório, o status, a quantidade de achados por severidade e a confirmação de que nenhum código ou documento de entrada foi alterado.
