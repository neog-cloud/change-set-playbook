# Descoberta e planejamento de Change Set: CS-001 — Aviso de manutenção programada

**Status:** pronto para especificação.
**Responsável pelo registro:** Product Owner.
**Participantes consultados:** suporte, UX e desenvolvimento web.

## 1. Problema e oportunidade

- **Situação atual:** pessoas usuárias só sabem de uma manutenção quando encontram o serviço indisponível.
- **Problema a resolver:** o suporte recebe contatos repetidos durante manutenções programadas.
- **Pessoas ou áreas impactadas:** pessoas usuárias, suporte e operações.
- **Valor esperado:** comunicar indisponibilidades previstas antes que elas afetem o uso do serviço.

## 2. Caso de uso e resultado esperado

- **Como pessoa usuária, quero ver um aviso de manutenção programada, para me organizar antes da indisponibilidade.**
- **Cenário principal:** ao acessar a página inicial durante uma janela de comunicação, a pessoa vê um aviso com data, horário e impacto estimado.
- **Resultado esperado para a pessoa usuária:** ela entende quando ocorrerá a manutenção e se o serviço será afetado.
- **Fora de escopo inicial:** agendamento automático, envio de e-mail e histórico de manutenções.

## 3. Contribuições e perspectivas

### Suporte

- O aviso deve usar linguagem simples e informar um canal de contato para dúvidas.

### UX

- O aviso deve ser visível sem impedir a navegação pela página.

### Desenvolvimento web

- A primeira versão pode usar um texto configurado diretamente na página inicial; não é necessário criar API.

## 4. Decisões e alinhamentos

| Tema | Decisão ou alinhamento | Responsável / origem | Impacto conhecido |
|---|---|---|---|
| Exibição | Mostrar um aviso no topo da página inicial. | UX | Não interrompe a navegação. |
| Conteúdo | Informar data, horário, impacto e contato do suporte. | Suporte | Reduz dúvidas recorrentes. |
| Configuração | Manter o texto no componente da página nesta primeira versão. | Desenvolvimento web | Sem API ou migração. |

## 5. Dúvidas, riscos e validações necessárias

| Item | Tipo | Próximo passo | Responsável |
|---|---|---|---|
| Leitura em telas menores | validação | Conferir o aviso em resolução móvel. | QA |

## 6. Encaminhamento para especificação

- **Decisão de seguir:** sim.
- **Resumo para a especificação:** adicionar um aviso não bloqueante na página inicial, com conteúdo acessível e sem dependência de API.
- **Referências:** nenhuma.
