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

## 3. Premissas técnicas

- **Stack e versões relevantes:** [Ex.: Go 1.xx, React, PostgreSQL, SQLC.]
- **Arquitetura e convenções:** [Padrões obrigatórios do projeto.]
- **Dependências permitidas / proibidas:** [Liste ou escreva “nenhuma nova dependência”.]
- **Referências de contexto:** [Links ou caminhos para planejamento, decisões e trechos relevantes de `docs/change-sets/index.md` e `source-tree.md`.]

## 4. Mapa inicial de contexto

| Arquivo ou diretório | Papel | Ação prevista |
|---|---|---|
| `[caminho]` | [contexto] | leitura / modificar / criar |

O mapa é uma referência inicial, não uma lista exaustiva. Arquivos adicionais podem ser modificados somente quando estritamente necessários para cumprir a especificação; eles devem constar do resumo final, com justificativa.

## 5. Critérios de aceite

| ID | Cenário observável | Resultado esperado | Evidência / teste |
|---|---|---|---|
| CA-01 | [Dado/quando] | [Resultado verificável] | [Teste ou comando] |
| CA-02 | [Falha ou regressão] | [Erro/estado esperado] | [Teste ou comando] |
| CA-03 | [Caso de borda] | [Resultado verificável] | [Teste ou comando] |

Inclua critérios de sucesso, falha, regressão e caso de borda aplicáveis. Prefira comportamento verificável a detalhes internos de implementação.

## 6. Estratégia de validação

- **Testes a criar ou atualizar:** [Caminhos e cenários.]
- **Comandos obrigatórios:**
  - `[comando de teste focal]`
  - `[lint / formatter]`
  - `[testes de regressão ou suíte relevante]`
  - `[geração de contrato, migração ou verificação adicional]`
- **Condição de conclusão:** todos os comandos aplicáveis devem passar; o relatório final deve registrar comando e resultado.

## 7. Instruções para a sessão de implementação

**Configuração recomendada:** GPT-5.6 Terra / `medium`. Use Terra / `high` se a tarefa exigir investigação adicional. Reserve Sol para mudança de alto risco, arquitetura, segurança, migração ou impacto transversal.

1. Leia esta especificação, o planejamento associado e os arquivos do mapa inicial.
2. Confirme decisões pendentes antes de implementar; não invente requisito material ausente.
3. Crie ou ajuste primeiro os testes definidos na seção 6 quando a tarefa permitir TDD.
4. Implemente somente o escopo desta Change Set, preservando contratos e comportamentos fora de escopo.
5. Execute as validações aplicáveis e corrija falhas relacionadas à Change Set.
6. Não faça commit, não atualize `docs/change-sets/index.md` ou `source-tree.md` e não altere arquivos externos ao escopo sem pedido explícito.
7. Ao criar ou renomear arquivos e diretórios, não use espaços: escreva nomes técnicos em minúsculas e substitua espaços por `_`.
8. Entregue um resumo conciso com: critérios atendidos, arquivos alterados/criados, arquivos adicionais e justificativas, comandos executados e pendências.

## 8. Gate de entrada para implementação

Antes da implementação, uma sessão independente deve confirmar:

- critérios de aceite testáveis;
- escopo e não escopo claros;
- contratos, riscos e decisões pendentes tratados;
- comandos de validação definidos;
- contexto suficiente, porém sem anexar documentos extensos irrelevantes.
