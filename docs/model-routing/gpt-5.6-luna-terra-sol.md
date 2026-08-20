# Guia prático: GPT-5.6 para desenvolvimento de software

## Decisão padrão

Use a família GPT-5.6 de forma complementar:

- **Luna** para tarefas rápidas, mecânicas e de alto volume.
- **Terra** como modelo padrão para o desenvolvimento cotidiano.
- **Sol** quando a dificuldade, o risco ou a ambiguidade justificarem mais raciocínio.

Em vez de escolher sempre o modelo mais forte, aumente primeiro o esforço apenas quando houver ganho real de qualidade. Isso preserva velocidade e custo sem sacrificar os pontos críticos do processo.

## Configuração recomendada para o fluxo diário

| Etapa | Modelo | Esforço | Objetivo |
|---|---|---|---|
| Definir e refinar a especificação | Terra | high | Eliminar ambiguidades, critérios de aceite e casos de borda. |
| Especificação arquitetural, integração complexa ou requisito incerto | Sol | high | Validar abordagem, impactos e riscos antes de programar. |
| Implementação normal | Terra | medium | Melhor equilíbrio entre qualidade, velocidade e custo. |
| Implementação simples e bem delimitada | Luna | medium | Executar alterações previsíveis com baixo custo. |
| Primeira revisão de código | Terra | high | Procurar erros funcionais, inconsistências e lacunas de teste. |
| Revisão de segurança, concorrência, migração ou mudança sensível | Sol | high ou xhigh | Buscar falhas sutis e consequências entre módulos. |
| Aplicar os ajustes encontrados | Terra | medium | Corrigir com contexto suficiente e ritmo ágil. |
| Ajustes repetitivos, lint, tipos, boilerplate e testes convencionais | Luna | low ou medium | Reduzir custo de trabalho mecânico. |
| Interpretar falhas de teste simples | Luna | low ou medium | Triar o problema rapidamente. |
| Diagnosticar falha persistente ou comportamento não determinístico | Terra ou Sol | high | Investigar hipóteses e efeitos colaterais. |
| Revisão final antes de integrar | Terra high; Sol high se o risco for alto | high | Conferir a especificação, o diff e os testes. |
| Mensagem de commit, changelog e organização final | Luna | low | Fechar a tarefa de forma rápida. |

## Como escolher o esforço

| Esforço | Quando usar |
|---|---|
| **none / low** | Transformações triviais, consultas, organização, documentação e tarefas com instrução objetiva. |
| **medium** | Padrão para implementar e depurar tarefas comuns. |
| **high** | Especificação, revisão, análise de bugs e mudanças que exigem relacionar vários arquivos. |
| **xhigh** | Casos difíceis: concorrência, segurança, arquitetura, migrações e bugs persistentes. |
| **max** | Exceção: use no Sol apenas quando a qualidade adicional for mais importante que latência e consumo. |

Mais esforço significa mais raciocínio interno: normalmente aumenta a latência e os tokens faturáveis. Não há um multiplicador fixo; o melhor uso é subir o esforço somente quando a tarefa justificar.

## Regras práticas

1. **Comece em Terra + medium** para uma tarefa de desenvolvimento típica.
2. **Suba para high antes de trocar para Sol** quando a tarefa ainda parecer administrável, mas exigir mais análise.
3. **Use Sol para decisões difíceis**, não para cada edição pequena.
4. **Delegue o mecânico para Luna**: busca, resumo de logs, testes previsíveis, lint, documentação e commit.
5. **Separe implementação e revisão**: peça a revisão a partir da especificação e do diff, com instrução explícita para procurar problemas. Um revisor com objetivo independente encontra mais falhas do que quem apenas confirma o próprio trabalho.
6. **Sempre informe o critério de aceite**: comportamento esperado, restrições, testes relevantes e o que não deve mudar. Uma boa especificação reduz mais custo do que aumentar o modelo.

## Exemplo de um ciclo completo

1. Terra/high define a especificação e os testes de aceite.
2. Terra/medium implementa a funcionalidade.
3. Luna/medium executa ou ajusta testes previsíveis e resume falhas.
4. Terra/high revisa o diff contra a especificação.
5. Terra/medium aplica as correções.
6. Sol/high faz a revisão final somente se houver risco elevado (segurança, dados, concorrência, pagamento, autenticação, migração etc.).
7. Luna/low prepara a mensagem de commit e o resumo da alteração.

## Custo relativo da API

Preços por milhão de tokens (entrada / saída):

| Modelo | Entrada | Saída |
|---|---:|---:|
| GPT-5.6 Luna | US$ 0,20 | US$ 1,20 |
| GPT-5.6 Terra | US$ 2,00 | US$ 12,00 |
| GPT-5.6 Sol | US$ 5,00 | US$ 30,00 |

Os valores são referência de API. No Codex com assinatura, a cobrança pode operar por limites ou créditos do plano, mas a proporção entre os modelos continua útil para organizar o consumo.

## Fórmula curta para lembrar

**Luna executa; Terra desenvolve; Sol decide e audita.**
