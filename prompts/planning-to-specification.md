# Prompt — Transformar `planning-<titulo>.md` em `specification-<titulo>.md`

Use este prompt depois que a descoberta e o planejamento de uma Change Set estiverem suficientemente alinhados e precisarem ser traduzidos em uma especificação técnica executável.

## Entrada

Preencha os campos abaixo:

```text
ID da Change Set: CS-[ID]
Título normalizado: [titulo]
Caminho do planejamento: docs/change-sets/cs-[ID]/planning-[titulo].md
Caminho de saída: docs/change-sets/cs-[ID]/specification-[titulo].md

Contexto adicional disponível:
[LINKS, DOCUMENTOS, RESTRIÇÕES OU “NENHUM”]
```

## Prompt

Você é responsável por transformar o planejamento de uma Change Set em uma especificação técnica clara, limitada e pronta para validação independente.

Leia primeiro o `README.md`, o `templates/change-set/specification.md`, o `planning-[titulo].md` indicado e, se existirem, `AGENTS.md`, as convenções e os documentos de contexto do projeto-alvo. Inspecione o código e a estrutura do projeto somente para confirmar contratos, padrões, caminhos e restrições existentes. Não implemente alterações.

### Objetivo

Crie ou atualize somente o arquivo `docs/change-sets/cs-[ID]/specification-[titulo].md`, usando o modelo de especificação. O `[titulo]` deve ser o mesmo slug em minúsculas usado em `planning-[titulo].md`. Escreva em português do Brasil e preserve a ligação explícita com o planejamento.

Traduza o planejamento para as seções do modelo:

- contexto e objetivo;
- escopo, não escopo e contratos;
- checklist de implementação;
- premissas técnicas;
- mapa inicial de contexto;
- critérios de aceite;
- estratégia de validação;
- instruções e gate de entrada para implementação.

### Regras de transformação

1. Use o `planning-[titulo].md` como fonte de intenção, contexto, decisões e limites. Não descarte uma restrição ou dúvida relevante sem registrá-la.
2. Separe claramente requisito de negócio, decisão já tomada, premissa técnica, hipótese e decisão pendente.
3. Investigue o projeto para localizar arquivos, módulos, contratos, testes e comandos existentes que sejam necessários ao entendimento. Cite caminhos reais no mapa inicial; não crie arquivos apenas para preencher a tabela.
4. Não invente requisitos, comportamentos, APIs, schemas, métricas, regras de autorização ou critérios de aceite. Quando uma informação material não puder ser confirmada, registre-a como decisão pendente, risco ou pergunta bloqueadora.
5. Defina o checklist de implementação com unidades pequenas, concretas e verificáveis. Inclua implementação, testes, documentação e validações quando aplicáveis. Mantenha todos os itens desmarcados.
6. Escreva critérios de aceite observáveis, cobrindo sucesso, falha, regressão e casos de borda relevantes. Relacione cada critério a uma evidência ou teste possível.
7. Descreva a estratégia de validação com comandos reais do projeto quando forem conhecidos. Não execute comandos destrutivos e não declare que uma validação passou sem executá-la.
8. Mantenha o escopo implementável em uma única Change Set. Se o checklist revelar um conjunto que exige planejamento, implementação e revisão próprios, registre essa recomendação como Sub-Change Set e preserve a separação no escopo.
9. Se houver dúvida material no planejamento, mantenha o status como `rascunho` e liste o bloqueio em “Decisões pendentes / riscos”. Use `validada` somente quando o escopo, contratos, critérios e validações estiverem suficientemente definidos.
10. Não implemente código, não crie testes, não altere o `planning-[titulo].md`, não atualize índices ou árvores estruturais e não faça commit.
11. Use nomes de arquivos e diretórios sem espaços; quando precisar sugerir um caminho, use minúsculas e `_` no lugar de espaços.

### Critério de conclusão

O trabalho está concluído quando `specification-[titulo].md`:

- traduz fielmente o problema e o resultado esperado do `planning-[titulo].md`;
- define incluído e fora de escopo sem ambiguidade material;
- registra contratos, premissas, riscos e decisões pendentes;
- contém um checklist de implementação pequeno e rastreável;
- contém critérios de aceite observáveis e uma estratégia de validação aplicável;
- aponta arquivos e documentos reais no mapa inicial;
- está pronto para uma sessão independente validar a especificação ou identifica claramente o que ainda bloqueia essa validação.

Ao final, informe apenas:

- caminho do arquivo criado ou atualizado;
- status atribuído;
- quantidade de itens do checklist e critérios de aceite;
- decisões pendentes ou riscos bloqueadores;
- confirmação de que nenhum código foi alterado e nenhuma implementação foi executada.
