# Revisão da especificação de [Change Set / Sub-Change Set]: CS-[ID] — [NOME]

**Nome do arquivo de destino:** `review-specification-<titulo>.md`, usando o mesmo slug dos demais artefatos.
Revise a especificação antes da implementação. Produza somente este relatório; **não modifique o planejamento, a especificação, código, testes ou outra documentação do projeto**.

**Idioma:** português do Brasil.
**Planejamento revisado:** `[planning-<titulo>.md]`.
**Especificação revisada:** `[specification-<titulo>.md]`.
**Base técnica inspecionada:** branch `[NOME]`, commit `[SHA]` ou tag `[REF]`.
**Relatório anterior:** `[caminho]` ou “primeira revisão”.

## Status

- **APROVADA:** todos os gates aplicáveis foram atendidos; a especificação pode receber status `validada` e seguir para implementação.
- **AJUSTES OBRIGATÓRIOS:** há lacunas corrigíveis antes da implementação; a especificação permanece `rascunho` ou `pronta para revisão`.
- **REPROVADA:** há contradição material, escopo inviável ou decisão bloqueadora sem resposta; a Change Set retorna ao planejamento ou é decomposta.

## Resumo executivo

- **Status:** [APROVADA / AJUSTES OBRIGATÓRIOS / REPROVADA].
- **Aderência ao planejamento:** [atendida / parcialmente atendida / não atendida].
- **Prontidão para implementação:** [sim / não].
- **Comandos ou verificações executados:** [comando — resultado] ou “nenhum”.

## Conferência do gate

| Condição | Resultado | Evidência |
|---|---|---|
| Cada requisito possui origem e comportamento verificável. | atende / não atende / não se aplica | [seção ou referência] |
| Cada `RQ-*` possui `CI-*`, `CA-*` e `VT-*` aplicáveis na matriz. | atende / não atende / não se aplica | [IDs] |
| Critérios, comandos/procedimentos e resultados esperados são verificáveis. | atende / não atende / não se aplica | [IDs] |
| Não há decisão, risco ou contrato material em aberto. | atende / não atende / não se aplica | [seção ou referência] |
| Escopo, não escopo e mapa inicial são coerentes com a base técnica. | atende / não atende / não se aplica | [caminhos ou referência] |

## Cobertura por requisito

| Requisito | Checklist | Critérios de aceite | Validações | Conclusão |
|---|---|---|---|---|
| RQ-01 | CI-01 | CA-01 | VT-01 | aprovado / ajuste requerido |

## Acompanhamento de achados anteriores

<!-- Na primeira revisão, escreva “Nenhum”. Nas posteriores, preserve cada ID e registre o reteste. -->

| Achado | Situação | Evidência do reteste |
|---|---|---|
| ESP-01 | corrigido / permanece aberto | [seção, diff ou verificação] |

## Achados

<!-- Se não houver achados, escreva “Nenhum”. -->

### ESP-01 — [BLOQUEADOR / ALTO / MÉDIO / BAIXO] — [título objetivo]

- **Seção da especificação:** `[seção]`.
- **Problema e evidência:** [o que está ausente, contraditório ou indefinido e a referência que demonstra isso].
- **Ajuste requerido:** [mudança imperativa e específica].
- **Impacto:** [risco para negócio, implementação, dados, segurança, contrato ou manutenção].
- **Validação requerida:** [como confirmar a correção ou “não se aplica”].

## Itens verificados

- [Garantia ou seção conferida] ou “Nenhum”.

## Conclusão

[Uma frase objetiva com o status e a próxima ação.]
