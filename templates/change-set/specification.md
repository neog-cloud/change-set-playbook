# Especificação de [Change Set / Sub-Change Set]: CS-[ID] — [NOME]

**Nome do arquivo de destino:** `specification-<titulo>.md`, usando o mesmo slug do `planning-<titulo>.md`.
**Idioma:** português do Brasil.
**Status:** rascunho / pronta para revisão / validada / em implementação / concluída.
**Base técnica:** branch `[NOME]`, commit `[SHA]` ou tag `[REF]`.
**Gate de entrada:** `[caminho de review-specification-<titulo>.md]` — [pendente / APROVADA / AJUSTES OBRIGATÓRIOS / REPROVADA].

**Convenção de ID:** `CS-001` a `CS-999`; após `CS-999`, use `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99`, e assim sucessivamente. Para uma Sub-Change Set independente, use `CS-[ID-PRINCIPAL]-[SUBITEM]`, como `CS-004-05`.

## 1. Contexto e objetivo

- **Contexto:** [Por que esta mudança é necessária?]
- **Objetivo:** [Qual resultado de negócio ou técnico deve existir ao final?]
- **Não objetivo:** [O que esta Change Set deliberadamente não altera?]
- **Decisões pendentes / riscos:** [Liste-as ou escreva “nenhum”.]

## 2. Escopo e contratos

### Incluído

- [Resultado ou comportamento que será entregue.]

### Requisitos rastreáveis

Todo comportamento incluído deve receber um ID `RQ-*`. Registre a origem para distinguir requisito confirmado de decisão técnica. Não inicie a implementação se algum requisito material estiver sem origem ou comportamento verificável.

| ID | Origem | Comportamento ou regra verificável | Criticidade |
|---|---|---|---|
| RQ-01 | [planning, seção / decisão / fonte] | [O que deve acontecer e em quais condições.] | alta / média / baixa |

### Fora de escopo

- [Comportamento, módulo ou melhoria relacionada que não será alterada.]

### Contratos e compatibilidade

- **API / eventos / CLI:** [Endpoints, payloads, códigos de erro ou “não se aplica”.]
- **Dados e migrações:** [Schema, backfill, rollback e compatibilidade ou “não se aplica”.]
- **Segurança e autorização:** [Perfis, tenant isolation, dados sensíveis ou “não se aplica”.]
- **Observabilidade:** [Logs, métricas, auditoria e informações que não podem ser registradas.]

## 3. Checklist de implementação

Liste unidades de trabalho pequenas, concretas e verificáveis. Cada item deve indicar o resultado esperado ou os arquivos afetados; agrupe por etapa quando ajudar a execução. Este checklist orienta a implementação e o acompanhamento do escopo, mas não substitui os critérios de aceite da seção 6.

- [ ] **CI-01 — [Etapa ou componente] (`RQ-01`):** [Alteração a implementar e resultado esperado.]
- [ ] **CI-02 — [Etapa ou componente] (`RQ-01`, `RQ-02`):** [Alteração a implementar e resultado esperado.]
- [ ] **CI-03 — [Testes, documentação ou validação] (`RQ-01`):** [Alteração a implementar e resultado esperado.]

Mantenha os itens desmarcados até a alteração correspondente estar implementada e validada. Se o checklist revelar uma parte com planejamento, implementação e revisão próprios, crie uma Sub-Change Set independente; caso contrário, mantenha-a como item desta especificação.

## 4. Premissas técnicas

- **Stack e versões relevantes:** [Ex.: Go 1.xx, React, PostgreSQL, SQLC.]
- **Arquitetura e convenções:** [Padrões obrigatórios do projeto.]
- **Dependências permitidas / proibidas:** [Liste ou escreva “nenhuma nova dependência”.]
- **Referências de contexto:** [Links ou caminhos para `planning-<titulo>.md`, decisões e trechos relevantes de `docs/change-sets/index.md` e `source-tree.md`.]

## 5. Mapa inicial de contexto

| Arquivo ou diretório | Papel | Ação prevista |
|---|---|---|
| `[caminho]` | [contexto] | leitura / modificar / criar |

O mapa é uma referência inicial, não uma lista exaustiva. Arquivos adicionais podem ser modificados somente quando estritamente necessários para cumprir a especificação; eles devem constar do resumo final, com justificativa.

## 6. Critérios de aceite

| ID | Requisito | Cenário observável | Resultado esperado | Evidência / teste |
|---|---|---|---|---|
| CA-01 | RQ-01 | [Dado/quando] | [Resultado verificável] | [Teste ou comando] |
| CA-02 | RQ-01 | [Falha ou regressão] | [Erro/estado esperado] | [Teste ou comando] |
| CA-03 | RQ-02 | [Caso de borda] | [Resultado verificável] | [Teste ou comando] |

Inclua critérios de sucesso, falha, regressão e caso de borda aplicáveis. Prefira comportamento verificável a detalhes internos de implementação.

## 7. Matriz de rastreabilidade e evidências

Preencha uma linha para cada `RQ-*` antes do gate. A pessoa implementadora preenche “Evidência obtida” após executar a validação; a revisão confere essa evidência, sem considerar resumo verbal como prova suficiente. Nenhuma coluna pode ficar vazia, salvo `não se aplica` com justificativa.

| Requisito | Checklist | Critérios de aceite | Validação | Evidência obtida | Situação |
|---|---|---|---|---|---|
| RQ-01 | CI-01, CI-03 | CA-01, CA-02 | VT-01, VT-02 | pendente | pendente / atendido / bloqueado |

## 8. Estratégia de validação

- **Testes a criar ou atualizar:** [Caminhos e cenários.]
- **Validações obrigatórias:**

| ID | Comando ou procedimento literal | Resultado esperado | Cobertura | Resultado obtido |
|---|---|---|---|---|
| VT-01 | `[comando de teste focal]` | [saída, status ou comportamento esperado] | CA-01 | pendente |
| VT-02 | `[lint / formatter]` | [saída ou status esperado] | RQ-01 | pendente |
| VT-03 | `[testes de regressão ou suíte relevante]` | [saída ou status esperado] | CA-02, CA-03 | pendente |

Registre “não se aplica” somente com justificativa verificável. A condição de conclusão é: todos os `VT-*` aplicáveis passam, cada `CA-*` possui evidência obtida e todos os `RQ-*` estão como atendidos na matriz.

## 9. Instruções para a sessão de implementação

**Configuração recomendada:** GPT-5.6 Terra / `medium`. Use Terra / `high` se a tarefa exigir investigação adicional. Reserve Sol para mudança de alto risco, arquitetura, segurança, migração ou impacto transversal.

1. Leia esta especificação, o `planning-<titulo>.md` associado, o `review-specification-<titulo>.md` aprovado e os arquivos do mapa inicial.
2. Confirme decisões pendentes antes de implementar; não invente requisito material ausente.
3. Use o checklist da seção 3 como roteiro; atualize cada item somente após implementar e validar a alteração correspondente.
4. Crie ou ajuste primeiro os testes e validações definidos na seção 8 quando a tarefa permitir TDD.
5. Implemente somente o escopo desta Change Set, preservando contratos e comportamentos fora de escopo.
6. Execute as validações aplicáveis, registre os resultados literais em `VT-*`, preencha as evidências da matriz e corrija falhas relacionadas à Change Set.
7. Não faça commit, não atualize `docs/change-sets/index.md` ou `source-tree.md` e não altere arquivos externos ao escopo sem pedido explícito.
8. Ao criar ou renomear arquivos e diretórios, não use espaços: escreva nomes técnicos em minúsculas e substitua espaços por `_`.
9. Não altere requisito, escopo, contrato ou critério de aceite silenciosamente. Registre qualquer desvio na seção 11 e retorne ao planejamento/especificação quando ele for material.
10. Entregue um resumo conciso com: critérios atendidos, itens do checklist concluídos, arquivos alterados/criados, arquivos adicionais e justificativas, comandos executados e pendências.

## 10. Gate de entrada para implementação

Antes da implementação, uma sessão independente deve confirmar:

- existe `review-specification-<titulo>.md` com status `APROVADA`;
- critérios de aceite testáveis;
- todos os requisitos `RQ-*` estão ligados a pelo menos um `CI-*`, `CA-*` e `VT-*` aplicável;
- checklist de implementação detalhado e compatível com o escopo;
- escopo e não escopo claros;
- contratos, riscos e decisões pendentes tratados, sem bloqueio material aberto;
- comandos ou procedimentos de validação literais e resultados esperados definidos;
- contexto suficiente, porém sem anexar documentos extensos irrelevantes.

Somente a sessão independente pode autorizar a alteração do status para `validada`. Sem esse gate, mantenha o status como `rascunho` ou `pronta para revisão` e não implemente.

## 11. Registro de execução e desvios

Preencha esta seção durante a implementação. Ela é a entrada persistente da revisão final.

- **Base implementada:** `[commit / branch / diff]`.
- **Arquivos fora do mapa inicial:** [caminho e justificativa] ou “nenhum”.
- **Desvios aprovados da especificação:** [decisão, responsável e impacto] ou “nenhum”.
- **Pendências conhecidas:** [item e impacto] ou “nenhuma”.
