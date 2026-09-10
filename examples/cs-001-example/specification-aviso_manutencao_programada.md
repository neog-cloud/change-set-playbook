# Especificação de Change Set: CS-001 — Aviso de manutenção programada

**Status:** concluída.
**Base técnica:** exemplo fictício.
**Gate de entrada:** [review-specification-aviso_manutencao_programada.md](review-specification-aviso_manutencao_programada.md) — APROVADA.

## 1. Contexto e objetivo

- **Contexto:** pessoas usuárias não recebem comunicação antecipada sobre manutenções programadas.
- **Objetivo:** exibir um aviso claro na página inicial durante uma manutenção programada.
- **Não objetivo:** criar API, agendamento ou notificações por e-mail.
- **Decisões pendentes / riscos:** nenhum.

## 2. Escopo e contratos

### Incluído

- Um aviso no topo da página inicial com data, horário, impacto e contato do suporte.
- Layout responsivo e não bloqueante.

### Requisitos rastreáveis

| ID | Origem | Comportamento ou regra verificável | Criticidade |
|---|---|---|---|
| RQ-01 | Planning, seções 2, 3 e 4 | Durante a janela de comunicação, a página inicial exibe data, horário, impacto e contato do suporte. | alta |
| RQ-02 | Planning, seções 3 e 5 | Em tela menor, o aviso permanece legível e não encobre a navegação. | média |

### Fora de escopo

- Gerenciamento de avisos por painel administrativo.
- Envio de notificações por outros canais.

### Contratos e compatibilidade

- **API / eventos / CLI:** não se aplica.
- **Dados e migrações:** não se aplica.
- **Segurança e autorização:** não se aplica.
- **Observabilidade:** não se aplica.

## 3. Checklist de implementação

- [x] **CI-01 — Página inicial (`RQ-01`):** adicionar o aviso no topo da página com data, horário, impacto e contato do suporte.
- [x] **CI-02 — Responsividade (`RQ-02`):** garantir que o aviso não esconda a navegação em telas menores.
- [x] **CI-03 — Validação (`RQ-01`, `RQ-02`):** conferir o texto e a exibição em tela larga e móvel.

## 4. Premissas técnicas

- **Stack e versões relevantes:** aplicação web existente.
- **Arquitetura e convenções:** reutilizar os componentes e estilos da página inicial.
- **Dependências permitidas / proibidas:** nenhuma nova dependência.
- **Referências de contexto:** [planning-aviso_manutencao_programada.md](planning-aviso_manutencao_programada.md).

## 5. Mapa inicial de contexto

| Arquivo ou diretório | Papel | Ação prevista |
|---|---|---|
| `web/src/pages/home.tsx` | Página inicial fictícia | modificar |
| `web/src/styles/home.css` | Estilos fictícios da página | modificar |

## 6. Critérios de aceite

| ID | Requisito | Cenário observável | Resultado esperado | Evidência / teste |
|---|---|---|---|---|
| CA-01 | RQ-01 | Pessoa acessa a página inicial durante uma manutenção. | Vê data, horário, impacto e contato do suporte. | VT-01. |
| CA-02 | RQ-02 | Pessoa acessa a página em tela menor. | O aviso permanece legível e não bloqueia a navegação. | VT-02. |

## 7. Matriz de rastreabilidade e evidências

| Requisito | Checklist | Critérios de aceite | Validação | Evidência obtida | Situação |
|---|---|---|---|---|---|
| RQ-01 | CI-01, CI-03 | CA-01 | VT-01 | Conferência visual registrada no cenário de manutenção fictício: data, horário, impacto e suporte visíveis. | atendido |
| RQ-02 | CI-02, CI-03 | CA-02 | VT-02 | Conferência visual registrada em viewport móvel fictício: aviso legível e navegação disponível. | atendido |

## 8. Estratégia de validação

- **Testes a criar ou atualizar:** não se aplica ao exemplo.
- **Validações obrigatórias:**

| ID | Comando ou procedimento literal | Resultado esperado | Cobertura | Resultado obtido |
|---|---|---|---|---|
| VT-01 | Verificação visual fictícia da página inicial durante a janela de manutenção. | Data, horário, impacto e contato do suporte estão visíveis. | CA-01 | passou |
| VT-02 | Verificação visual fictícia da página inicial em viewport móvel. | Aviso legível; navegação não está encoberta. | CA-02 | passou |

## 9. Instruções para a sessão de implementação

Implementar somente os requisitos RQ-01 e RQ-02, preencher a matriz com as evidências obtidas e registrar qualquer desvio antes da revisão final.

## 10. Gate de entrada para implementação

O gate foi aprovado no relatório [review-specification-aviso_manutencao_programada.md](review-specification-aviso_manutencao_programada.md); não havia decisões materiais pendentes.

## 11. Registro de execução e desvios

- **Base implementada:** implementação fictícia do aviso de manutenção programada.
- **Arquivos fora do mapa inicial:** nenhum.
- **Desvios aprovados da especificação:** nenhum.
- **Pendências conhecidas:** nenhuma.
