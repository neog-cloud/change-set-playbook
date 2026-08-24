# Revisão de [Change Set / Sub-Change Set]: CS-[ID] — [NOME]

**Nome do arquivo de destino:** `review-<titulo>.md`, usando o mesmo slug do `planning-<titulo>.md` e `specification-<titulo>.md`.
Revise a implementação da Change Set usando a documentação e a base indicadas abaixo. Produza somente o relatório de revisão; **não modifique código, testes ou documentação do projeto**.

**Idioma:** português do Brasil.
**Base do diff:** `[branch / commit / tag de referência]` → `[HEAD / branch revisada]`.
**Documentos de entrada:** `[planning-<titulo>.md]`, `[specification-<titulo>.md]`, `[resultados de validação]`.

**Convenção de ID:** `CS-001` a `CS-999`; após `CS-999`, use `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99`, e assim sucessivamente. Para uma Sub-Change Set independente, use `CS-[ID-PRINCIPAL]-[SUBITEM]`, como `CS-004-05`.

**Convenção de arquivos:** não crie arquivos ou diretórios com espaços. Use o padrão `review-<titulo>.md`, com o mesmo slug em minúsculas e separado por `_` usado nos demais artefatos; preserve o título legível apenas dentro do documento.

## Instruções de auditoria

**Configuração recomendada:** GPT-5.6 Terra / `high`. Use GPT-5.6 Sol / `high` ou `xhigh` para segurança, concorrência, migração, dados financeiros, autenticação ou alteração transversal.

1. Leia o `planning-<titulo>.md`, o `specification-<titulo>.md`, o diff e os resultados de validação antes de concluir.
2. Audite aderência ao escopo, critérios de aceite, testes, regressões, contratos, tratamento de erro, autorização/isolamento, dados e observabilidade quando aplicáveis.
3. Execute somente verificações não destrutivas autorizadas pela Change Set. Registre comandos e resultados relevantes.
4. Não presuma que um teste existente prova o critério: verifique o cenário e a qualidade da asserção.
5. Não reporte preferências pessoais como defeitos. Priorize impacto funcional, risco e divergência da especificação.

## Status

- **APROVADO:** nenhum ajuste pendente; critérios e validações aplicáveis atendidos.
- **AJUSTES OBRIGATÓRIOS:** há correções necessárias, sem bloqueador crítico imediato.
- **REPROVADO:** há defeito crítico, risco alto ou falha que impede a integração.

## Estrutura obrigatória do arquivo de saída

Salve em `docs/change-sets/cs-[ID]/review-<titulo>.md`.

```md
# Relatório de Revisão — Change Set CS-[ID]

## Resumo executivo

- Status: [APROVADO / AJUSTES OBRIGATÓRIOS / REPROVADO]
- Aderência ao escopo: [atendida / parcialmente atendida / não atendida]
- Base auditada: `[referência do diff]`
- Arquivos auditados: [lista]
- Validações executadas: [comando — resultado]

## Checklist de correção

<!-- Se não houver achados, escreva “Nenhum”. -->

### [CRÍTICO / ALTO / MÉDIO / BAIXO] — [título objetivo]

- Arquivo e linha: `[caminho:linha]`
- Correção requerida: [instrução imperativa, pronta para a sessão de implementação]
- Evidência: [comportamento atual, diff ou cenário reproduzível]
- Esperado: [critério da especificação ou comportamento correto]
- Impacto: [efeito para usuário, dados, segurança, contrato ou manutenção]
- Teste requerido: [novo teste, ajuste de teste ou “não se aplica”]

## Itens verificados com sucesso

- [Critério de aceite ou garantia verificada]

## Pendências e riscos residuais

- [Item] ou “Nenhum”.
```

Um relatório com `AJUSTES OBRIGATÓRIOS` ou `REPROVADO` retorna à sessão de implementação. A revisão posterior deve conferir cada item do checklist e também regressões causadas pelas correções. O procedimento pós-Change Set só começa após `APROVADO`.
