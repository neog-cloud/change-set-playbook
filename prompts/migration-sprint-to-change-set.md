# Prompt — Migração de “Sprint” para “Change Set” na documentação

**Modelo recomendado:** GPT-5.6 Luna / `low`.
**Objetivo:** migrar a terminologia e a estrutura documental sem modificar código, histórico Git ou conteúdo não relacionado.

Copie o prompt abaixo para uma nova sessão, no diretório raiz do projeto.

```text
Migre a documentação deste repositório da terminologia “Sprint” para “Change Set”.

Definição adotada:
- Uma Change Set é uma unidade rastreável de mudança de engenharia.
- Pode conter planejamento, especificação, implementação, revisões iterativas, validação, commits e procedimento pós-Change Set.
- Uma Change Set pode conter um ou mais commits.
- O identificador da Change Set usa três dígitos: `CS-001`, `CS-002`, …, `CS-999`.
- Após `CS-999`, a sequência continua por blocos alfabéticos: `CS-A01` a `CS-A99`, depois `CS-B01` a `CS-B99`, e assim sucessivamente.
- “Sessão” é a interação com um agente; “commit” é o registro Git. Não use esses termos como sinônimos de Change Set.

Escopo autorizado:
- Apenas documentação e artefatos de documentação: arquivos Markdown, diretórios de documentação, links internos, índices, modelos e instruções operacionais presentes na documentação.
- Renomeie arquivos e diretórios documentais quando necessário para refletir a nova convenção.
- Atualize links Markdown relativos, referências de caminhos e âncoras afetadas.
- Use `git mv` para arquivos e diretórios rastreados pelo Git, preservando o histórico de renomeação.

Fora de escopo:
- Não altere código-fonte, testes, configuração, pipelines, dependências, banco de dados, contratos de API, arquivos binários ou histórico Git.
- Não faça commit.
- Não altere ocorrências de “sprint” que não sejam documentação do processo de engenharia sem confirmar que pertencem a esta convenção.
- Preserve nomes de commits históricos, hashes, URLs externas, citações e registros históricos literais, salvo quando forem instruções operacionais que devem apontar para a nova estrutura.
- Preserve o idioma, conteúdo técnico e afirmações factuais dos documentos; altere apenas o necessário para a migração terminológica e de caminhos.

Convenção-alvo — aplique somente aos itens que existirem e fizerem parte da documentação de Change Sets:

| Antes | Depois |
|---|---|
| Sprint 1 / Sprint 01 | Change Set CS-001 |
| sprint-1 / sprint-01 | cs-001 |
| docs/sprints/ | docs/change-sets/ |
| docs/sprints/indice-sprints.md | docs/change-sets/index.md |
| modelo-especificacao-sprint.md | modelo-especificacao-change-set.md |
| modelo-revisao-sprint.md | modelo-revisao-change-set.md |
| modelo-pos-sprint.md | modelo-pos-change-set.md |
| pós-sprint | pós-Change Set |

Converta a numeração existente para três dígitos, preservando seu valor: `sprint-1` e `sprint-01` tornam-se `cs-001`; `Sprint 12` torna-se `Change Set CS-012`; `sprint-100` torna-se `cs-100`. Não invente, reordene ou reutilize números. A sequência alfabética (`CS-A01`, `CS-B01` etc.) só é usada para novas Change Sets após `CS-999`; não a aplique nesta migração salvo se ela já existir no projeto.

Procedimento:

1. Inspecione `git status --short` e registre alterações pré-existentes. Não as toque.
2. Localize os documentos e referências candidatas com `rg` e `find`, começando por `docs/`. Monte um inventário breve de diretórios, arquivos, links e termos que serão afetados.
3. Se a estrutura real divergir materialmente da convenção-alvo ou houver ambiguidade que possa alterar conteúdo fora do escopo, pare antes de editar e apresente a ambiguidade com os caminhos envolvidos.
4. Renomeie diretórios e arquivos documentais necessários usando `git mv` quando forem rastreados.
5. Atualize o conteúdo Markdown: títulos, termos, caminhos, links relativos, rótulos de navegação, modelos e instruções de criação de novas Change Sets.
6. Não altere automaticamente referências históricas que sejam nomes reais de commits, URLs externas, hashes ou transcrições. Liste-as como exceções se permanecerem com “Sprint”.
7. Valide a migração:
   - execute `git diff --check`;
   - procure referências internas obsoletas a `docs/sprints`, `indice-sprints`, padrões `sprint-[0-9]` e nomes antigos de modelos, restringindo a busca à documentação;
   - confirme que cada link relativo alterado aponta para um arquivo existente;
   - confirme que o índice e as pastas de Change Sets usam a nova nomenclatura de forma coerente.
8. Não faça commit. Ao finalizar, entregue somente:
   - arquivos e diretórios renomeados;
   - documentos atualizados;
   - validações executadas e resultados;
   - referências históricas preservadas ou exceções encontradas;
   - pendências ou ambiguidades, se houver.

Critério de conclusão:
- A documentação operacional usa “Change Set”, a estrutura `docs/change-sets/` e IDs no padrão `CS-001` onde aplicável.
- Links internos e referências de caminho afetados não estão quebrados.
- Não há modificações fora do escopo autorizado.
```
