# Especificação de Change Set: CS-001 — Aviso de manutenção programada

**Status:** concluída.
**Base técnica:** exemplo fictício.

## 1. Contexto e objetivo

- **Contexto:** pessoas usuárias não recebem comunicação antecipada sobre manutenções programadas.
- **Objetivo:** exibir um aviso claro na página inicial durante uma manutenção programada.
- **Não objetivo:** criar API, agendamento ou notificações por e-mail.
- **Decisões pendentes / riscos:** nenhum.

## 2. Escopo e contratos

### Incluído

- Um aviso no topo da página inicial com data, horário, impacto e contato do suporte.
- Layout responsivo e não bloqueante.

### Fora de escopo

- Gerenciamento de avisos por painel administrativo.
- Envio de notificações por outros canais.

### Contratos e compatibilidade

- **API / eventos / CLI:** não se aplica.
- **Dados e migrações:** não se aplica.
- **Segurança e autorização:** não se aplica.
- **Observabilidade:** não se aplica.

## 3. Checklist de implementação

- [x] **CI-01 — Página inicial:** adicionar o aviso no topo da página com data, horário, impacto e contato do suporte.
- [x] **CI-02 — Responsividade:** garantir que o aviso não esconda a navegação em telas menores.
- [x] **CI-03 — Validação:** conferir o texto e a exibição em tela larga e móvel.

## 4. Premissas técnicas

- **Stack e versões relevantes:** aplicação web existente.
- **Arquitetura e convenções:** reutilizar os componentes e estilos da página inicial.
- **Dependências permitidas / proibidas:** nenhuma nova dependência.
- **Referências de contexto:** [planning.md](planning.md).

## 5. Mapa inicial de contexto

| Arquivo ou diretório | Papel | Ação prevista |
|---|---|---|
| `web/src/pages/home.tsx` | Página inicial fictícia | modificar |
| `web/src/styles/home.css` | Estilos fictícios da página | modificar |

## 6. Critérios de aceite

| ID | Cenário observável | Resultado esperado | Evidência / teste |
|---|---|---|---|
| CA-01 | Pessoa acessa a página inicial durante uma manutenção. | Vê data, horário, impacto e contato do suporte. | Conferência visual. |
| CA-02 | Pessoa acessa a página em tela menor. | O aviso permanece legível e não bloqueia a navegação. | Conferência em resolução móvel. |

## 7. Estratégia de validação

- **Testes a criar ou atualizar:** não se aplica ao exemplo.
- **Comandos obrigatórios:** build e verificação visual da aplicação fictícia.
- **Condição de conclusão:** os critérios de aceite são conferidos e o resumo registra o resultado.
