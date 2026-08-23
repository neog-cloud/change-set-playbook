# Especificação de [Change Set / Sub-Change Set]: CS-[ID] — [NOME]

**Idioma:** português do Brasil.
**Status:** rascunho / validada / em implementação / concluída.
**Base técnica:** branch `[NOME]`, commit `[SHA]` ou tag `[REF]`.

**Convenção de ID:** `CS-001` a `CS-999`; após `CS-999`, use `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99`, e assim sucessivamente. Para uma Sub-Change Set independente, use `CS-[ID-PRINCIPAL]-[SUBITEM]`, como `CS-004-05`.

## 1. Contexto e objetivo

- **Contexto:** [Por que esta mudança é necessária?]
- **Objetivo:** [Qual resultado de negócio ou técnico deve existir ao final?]
- **Não objetivo:** [O que esta Change Set deliberadamente não altera?]
- **Decisões pendentes / riscos:** [Liste-as ou escreva “nenhum”.]

## 2. Escopo e contratos

### Incluído

- [Resultado ou comportamento que será entregue.]

### Fora de escopo

- [Comportamento, módulo ou melhoria relacionada que não será alterada.]

### Contratos e compatibilidade

- **API / eventos / CLI:** [Endpoints, payloads, códigos de erro ou “não se aplica”.]
- **Dados e migrações:** [Schema, backfill, rollback e compatibilidade ou “não se aplica”.]
- **Segurança e autorização:** [Perfis, tenant isolation, dados sensíveis ou “não se aplica”.]
- **Observabilidade:** [Logs, métricas, auditoria e informações que não podem ser registradas.]

## 3. Checklist de implementação

Liste unidades de trabalho pequenas, concretas e verificáveis. Cada item deve indicar o resultado esperado ou os arquivos afetados; agrupe por etapa quando ajudar a execução. Este checklist orienta a implementação e o acompanhamento do escopo, mas não substitui os critérios de aceite da seção 6.

- [ ] **CI-01 — [Etapa ou componente]:** [Alteração a implementar e resultado esperado.]
- [ ] **CI-02 — [Etapa ou componente]:** [Alteração a implementar e resultado esperado.]
- [ ] **CI-03 — [Testes, documentação ou validação]:** [Alteração a implementar e resultado esperado.]

Mantenha os itens desmarcados até a alteração correspondente estar implementada e validada. Se o checklist revelar uma parte com planejamento, implementação e revisão próprios, crie uma Sub-Change Set independente; caso contrário, mantenha-a como item desta especificação.

## 4. Premissas técnicas

- **Stack e versões relevantes:** [Ex.: Go 1.xx, React, PostgreSQL, SQLC.]
- **Arquitetura e convenções:** [Padrões obrigatórios do projeto.]
- **Dependências permitidas / proibidas:** [Liste ou escreva “nenhuma nova dependência”.]
- **Referências de contexto:** [Links ou caminhos para `planning.md`, decisões e trechos relevantes de `docs/change-sets/index.md` e `source-tree.md`.]

## 5. Mapa inicial de contexto

| Arquivo ou diretório | Papel | Ação prevista |
|---|---|---|
| `[caminho]` | [contexto] | leitura / modificar / criar |

O mapa é uma referência inicial, não uma lista exaustiva. Arquivos adicionais podem ser modificados somente quando estritamente necessários para cumprir a especificação; eles devem constar do resumo final, com justificativa.

## 6. Critérios de aceite

| ID | Cenário observável | Resultado esperado | Evidência / teste |
|---|---|---|---|
| CA-01 | [Dado/quando] | [Resultado verificável] | [Teste ou comando] |
| CA-02 | [Falha ou regressão] | [Erro/estado esperado] | [Teste ou comando] |
| CA-03 | [Caso de borda] | [Resultado verificável] | [Teste ou comando] |

Inclua critérios de sucesso, falha, regressão e caso de borda aplicáveis. Prefira comportamento verificável a detalhes internos de implementação.

## 7. Estratégia de validação

- **Testes a criar ou atualizar:** [Caminhos e cenários.]
- **Comandos obrigatórios:**
  - `[comando de teste focal]`
  - `[lint / formatter]`
  - `[testes de regressão ou suíte relevante]`
  - `[geração de contrato, migração ou verificação adicional]`
- **Condição de conclusão:** todos os comandos aplicáveis devem passar; o relatório final deve registrar comando e resultado.

## 8. Instruções para a sessão de implementação

**Configuração recomendada:** GPT-5.6 Terra / `medium`. Use Terra / `high` se a tarefa exigir investigação adicional. Reserve Sol para mudança de alto risco, arquitetura, segurança, migração ou impacto transversal.

1. Leia esta especificação, o `planning.md` associado e os arquivos do mapa inicial.
2. Confirme decisões pendentes antes de implementar; não invente requisito material ausente.
3. Use o checklist da seção 3 como roteiro; atualize cada item somente após implementar e validar a alteração correspondente.
4. Crie ou ajuste primeiro os testes definidos na seção 7 quando a tarefa permitir TDD.
5. Implemente somente o escopo desta Change Set, preservando contratos e comportamentos fora de escopo.
6. Execute as validações aplicáveis e corrija falhas relacionadas à Change Set.
7. Não faça commit, não atualize `docs/change-sets/index.md` ou `source-tree.md` e não altere arquivos externos ao escopo sem pedido explícito.
8. Ao criar ou renomear arquivos e diretórios, não use espaços: escreva nomes técnicos em minúsculas e substitua espaços por `_`.
9. Entregue um resumo conciso com: critérios atendidos, itens do checklist concluídos, arquivos alterados/criados, arquivos adicionais e justificativas, comandos executados e pendências.

## 9. Gate de entrada para implementação

Antes da implementação, uma sessão independente deve confirmar:

- critérios de aceite testáveis;
- checklist de implementação detalhado e compatível com o escopo;
- escopo e não escopo claros;
- contratos, riscos e decisões pendentes tratados;
- comandos de validação definidos;
- contexto suficiente, porém sem anexar documentos extensos irrelevantes.
