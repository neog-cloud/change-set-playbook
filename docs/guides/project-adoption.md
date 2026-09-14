# Adoção em um projeto

## 1. Copie o kit da metodologia

Adicione estes arquivos à codebase do projeto. O primeiro caminho mostra que o modelo deve ser copiado com outro nome:

```text
templates/agents.md                     → AGENTS.md
docs/
└── features/
    └── README.md
.change-set/
├── guides/
│   └── documentation-maintenance.md
├── methodology/
│   └── change-set.md
├── prompts/
│   └── implement-issue.md
└── templates/
    ├── feature.md
    ├── issue.md
    └── pull-request.md
```

Copie os demais arquivos preservando os caminhos. Se o projeto já possuir um `AGENTS.md`, incorpore nele as regras de `templates/agents.md` em vez de substituir o arquivo.

Cada arquivo tem uma responsabilidade:

| Arquivo | Uso |
|---|---|
| `templates/agents.md` → `AGENTS.md` | Modelo das regras permanentes que o agente aplica em qualquer tarefa. |
| `.change-set/prompts/implement-issue.md` | Roteiro operacional usado a cada implementação. |
| `.change-set/templates/issue.md` | Estrutura mínima para descrever features, bugs e outras mudanças. |
| `.change-set/templates/feature.md` | Estrutura da documentação funcional permanente. |
| `.change-set/templates/pull-request.md` | Estrutura da entrega e das evidências de validação. |
| `docs/features/README.md` | Regras de organização da documentação funcional. |
| `.change-set/guides/documentation-maintenance.md` | Orientação humana sobre quando e onde documentar. |
| `.change-set/methodology/change-set.md` | Definição resumida do método e de suas fontes de verdade. |

O `AGENTS.md` da raiz, o `README.md`, o `CHANGELOG.md`, os exemplos e este guia pertencem ao repositório do playbook e não são necessários para executar o fluxo no projeto consumidor.

Quando não houver um gerenciador externo de issues, acrescente também o diretório opcional:

```text
.change-set/issues/
└── issue_001_<titulo>.md
```

Os documentos de funcionalidades reais serão criados gradualmente em `docs/features/`; não copie os exemplos como documentação do projeto.

### Instalação automatizada

Execute o script a partir do repositório do playbook, informando o diretório base do projeto:

```bash
./scripts/setup-project.sh /caminho/do/projeto
```

Para conferir as operações antes de alterar o projeto:

```bash
./scripts/setup-project.sh --dry-run /caminho/do/projeto
```

Se as issues também forem armazenadas na codebase:

```bash
./scripts/setup-project.sh --with-local-issues /caminho/do/projeto
```

O script pode ser executado novamente quando o playbook mudar. O kit fica em `.change-set/`, evitando colisões com diretórios já existentes de prompts e modelos; somente `AGENTS.md` e `docs/features/README.md` ficam fora dele. Arquivos diferentes são atualizados, e suas versões anteriores ficam em `.change-set-playbook-backups/`. No `AGENTS.md`, somente o bloco delimitado por `change-set-playbook` é gerenciado; regras e comandos próprios do projeto devem permanecer fora dele.

Para migrar uma instalação feita com o layout anterior, simule e depois execute:

```bash
./scripts/setup-project.sh --dry-run --migrate-legacy /caminho/do/projeto
./scripts/setup-project.sh --migrate-legacy /caminho/do/projeto
```

Use `--migrate-legacy` somente quando os caminhos antigos pertencerem a uma instalação anterior do playbook. Ele interrompe a execução diante de conflitos no destino, sem remover nenhum arquivo; arquivos migrados que diferirem da versão atual são preservados no backup antes da atualização.

## 2. Adapte as regras permanentes

Crie o `AGENTS.md` a partir de `templates/agents.md` e mantenha nele apenas regras que valem para qualquer tarefa do projeto. Preencha os comandos usuais de teste, lint e build.

Não obrigue o agente a reler o README, todos os guias ou todos os modelos em cada mudança.

O modelo autoriza o uso, sem confirmação individual, de comandos rotineiros de leitura e validação com `git` e `gh`. Essa instrução orienta o agente, mas não substitui as permissões do ambiente: prompts de segurança, especialmente para rede, escrita externa, `commit`, `push`, merge, publicação, exclusões ou outras ações irreversíveis, continuam dependendo da configuração da ferramenta e da sessão.

## 3. Padronize as issues e pull requests

Adote os modelos de issue e pull request em `.change-set/templates/`. A issue deve conseguir explicar o problema e o resultado observável sem antecipar a implementação.

### Com gerenciador de issues

Use o número ou link de GitHub, GitLab, Jira, Linear, Azure DevOps ou ferramenta equivalente. O agente precisa ter acesso ao conteúdo; se não tiver, forneça também o texto completo.

```text
Implemente a issue #142 seguindo .change-set/prompts/implement-issue.md.
```

### Sem gerenciador de issues

Para manter rastreabilidade na própria codebase, crie arquivos a partir de `.change-set/templates/issue.md`:

```text
.change-set/issues/
├── issue_001_aviso_manutencao.md
├── issue_002_corrigir_login.md
└── issue_003_exportar_relatorio.md
```

Use um identificador sequencial, título em minúsculas e `_` entre as palavras. Execute assim:

```text
Implemente a issue descrita em .change-set/issues/issue_002_corrigir_login.md
seguindo .change-set/prompts/implement-issue.md.
```

Mantenha o arquivo depois da conclusão quando ele for a fonte primária da solicitação. Referencie o identificador na mensagem do commit:

```text
fix: corrige validação de login

Issue: issue_002
```

### Issue fornecida no próprio comando

Para uma tarefa sem arquivo ou tracker, cole o conteúdo completo no comando:

```text
Siga .change-set/prompts/implement-issue.md.

Issue:
[CONTEÚDO PREENCHIDO CONFORME .change-set/templates/issue.md]
```

Essa opção executa o mesmo fluxo, mas a rastreabilidade dependerá do histórico da ferramenta que armazenar a conversa.

## 4. Crie a documentação funcional

Crie `docs/features/` e use `.change-set/templates/feature.md`. Documente somente funcionalidades cujo comportamento precise ser compreendido ou preservado ao longo do tempo.

## 5. Execute a mudança

Use `.change-set/prompts/implement-issue.md`. A mesma sessão investiga, planeja, implementa, testa e atualiza a documentação.

## 6. Revise no pull request

Confira o resultado esperado da issue, o diff, os testes e a documentação. Registre correções no PR ou no mecanismo de revisão disponível e mantenha o vínculo entre issue, revisão e commits.
