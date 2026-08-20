# Procedimento pós-[Change Set / Sub-Change Set]: CS-[ID] — [NOME]

Execute este procedimento somente após a última revisão da Change Set receber status **APROVADO**.

**Convenção de ID:** `CS-001` a `CS-999`; após `CS-999`, use `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99`, e assim sucessivamente. Para uma Sub-Change Set independente, use `CS-[ID-PRINCIPAL]-[SUBITEM]`, como `CS-004-05`.

## Pré-condições obrigatórias

- [ ] Relatório de revisão final aprovado e sem pendências.
- [ ] Critérios de aceite atendidos.
- [ ] Testes, lint, formatter, geração de contrato e validações aplicáveis executados com sucesso.
- [ ] `git status` verificado; não há alterações não relacionadas à Change Set.
- [ ] Diff final revisado; os arquivos alterados correspondem ao escopo aprovado.

## 1. Commit da implementação

1. Confirme que apenas alterações da Change Set compõem o commit.
2. Aplique o commit de implementação com mensagem no padrão do projeto.
3. Registre o hash do commit no resumo da Change Set.

## 2. Atualização da documentação de contexto

Atualize os documentos a partir do **diff real** e dos artefatos aprovados; não dependa apenas da memória da implementação.

### `docs/change-sets/index.md`

- Adicione ou atualize a Change Set na tabela “Visão Geral” com status `Concluída`.
- Acrescente a seção detalhada ao final: nome, objetivo, resumo, critérios relevantes e arquivos criados/modificados.
- Preserve a ordem, âncoras e formato existentes.

### `docs/source-tree.md`

- Atualize a data e a Change Set de referência no cabeçalho.
- Inclua arquivos criados, removidos ou materialmente alterados nas árvores relevantes.
- Atualize rotas HTTP, contratos ou comandos quando aplicável.
- Recalcule os contadores da visão geral; não estime os valores.
- Atualize a seção de documentação e comentários de arquivos alterados.
- Verifique coerência com `docs/change-sets/index.md`: a Change Set mais recente, data e arquivos devem concordar.

## 3. Verificação da documentação

- [ ] Links, caminhos e âncoras válidos.
- [ ] Contadores e rotas conferidos contra a árvore de trabalho/commit.
- [ ] Nenhuma informação de credencial, dado sensível ou configuração local incluída.
- [ ] Índice e árvore representam a mesma última Change Set concluída.

## 4. Commit documental

Após revisar o diff documental, aplique um commit separado:

```text
docs: adiciona Change Set CS-[ID] ao índice e source-tree
```

## 5. Registro final

Produza um resumo breve contendo:

- Change Set e objetivo;
- hashes dos commits de implementação e documentação;
- testes/validações executados;
- documentos atualizados;
- risco residual ou “nenhum”.

**Configuração recomendada:** Luna / `low` para organizar o resumo e rascunhar documentação; Terra / `medium` para conferir coerência entre diff, índice e árvore. Não use Sol salvo se a verificação final envolver decisão técnica de alto risco.
