# Change Set Playbook

Modelos, prompts e guias para conduzir mudanças de engenharia assistidas por IA com rastreabilidade, revisão independente e validação.

## O que é uma Change Set?

Uma **Change Set** é uma unidade rastreável de mudança de engenharia: funcionalidade, correção, refatoração, investigação técnica ou alteração documental. Ela pode conter uma ou mais sessões com agentes de IA e um ou mais commits Git.

```text
Descoberta e planejamento → Especificação → Validação da especificação → Implementação
→ Revisão independente → Correções iterativas → Aprovação → Pós-Change Set
```

## Convenção de identificação

| Faixa | Formato | Exemplo |
|---|---|---|
| 1 a 999 | `CS-001` a `CS-999` | `CS-042` |
| Após 999 | `CS-A01` a `CS-A99` | `CS-A01` |
| Próximos blocos | `CS-B01`, `CS-C01` etc. | `CS-B01` |

Os IDs ordenam alfabeticamente. A letra só passa a ser usada após `CS-999`.

Sub-Change Sets que tiveram implementação e revisão próprias usam o ID do item principal seguido de um sufixo de dois dígitos: `CS-004-05`, `CS-004-06`. Eles não consomem um novo ID principal.

## Roteamento GPT-5.6

| Etapa | Modelo | Esforço |
|---|---|---|
| Organização, documentação e trabalho mecânico | Luna | low / medium |
| Planejamento, especificação e implementação normal | Terra | medium / high |
| Arquitetura, segurança e revisão de alto risco | Sol | high / xhigh |

> Luna executa; Terra desenvolve; Sol decide e audita.

Consulte o [guia de roteamento](docs/model-routing/gpt-5.6-luna-terra-sol.md) para detalhes.

## Estrutura

```text
templates/change-set/   Modelos de especificação, revisão e pós-Change Set
prompts/                Prompts reutilizáveis para tarefas operacionais
docs/methodology/       Método e convenções
docs/model-routing/     Uso dos modelos GPT-5.6
docs/guides/            Guias de adoção e manutenção
examples/               Exemplos fictícios completos
```

## Convenção de nomes de arquivos

Não crie arquivos ou diretórios com espaços no nome. Para os artefatos de uma Change Set, use o padrão `planning-<titulo>.md`, `specification-<titulo>.md`, `review-<titulo>.md` e `post-change-set-<titulo>.md`. O `<titulo>` deve ser um slug em minúsculas, com palavras separadas por `_`, como `aviso_manutencao_programada`. Essa regra vale também para arquivos copiados dos modelos; títulos legíveis devem ficar dentro do conteúdo do arquivo, não no nome do caminho.

## Uso rápido

1. Copie os modelos de `templates/change-set/` para `docs/change-sets/cs-[ID]/` no projeto-alvo. Use uma pasta própria para cada Sub-Change Set independente.
2. Registre a descoberta e o planejamento em `planning-<titulo>.md`; depois preencha `specification-<titulo>.md` e o checklist de implementação antes de implementar.
3. Faça a revisão em uma sessão independente.
4. Execute o pós-Change Set somente após status `APROVADO`.

O prompt para migrar documentação legada de “Sprint” para “Change Set” está em [prompts/migration-sprint-to-change-set.md](prompts/migration-sprint-to-change-set.md).

## Licença

Este material está licenciado sob [Creative Commons Attribution 4.0 International](LICENSE) (CC BY 4.0).
