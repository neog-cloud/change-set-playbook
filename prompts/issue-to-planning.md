# Prompt — Transformar uma issue em `planning-<titulo>.md`

Use este prompt quando uma issue criada por uma pessoa usuária precisar ser transformada no documento de descoberta e planejamento de uma Change Set.

## Entrada

Preencha os campos abaixo e mantenha o texto original da issue completo:

```text
ID da Change Set: CS-[ID]
Título normalizado: [titulo]
Caminho de saída: docs/change-sets/cs-[ID]/planning-[titulo].md

Issue original:
[COLE A ISSUE COMPLETA AQUI]

Contexto adicional disponível:
[LINKS, DOCUMENTOS OU “NENHUM”]
```

## Prompt

Você é responsável por transformar a issue fornecida em um documento de descoberta e planejamento para uma Change Set.

Leia primeiro o `README.md`, o `templates/change-set/planning.md` e, se existirem, o `README.md`, `AGENTS.md`, as convenções e os documentos de contexto do projeto-alvo. Consulte arquivos do projeto somente para esclarecer termos, fluxos ou restrições já existentes; não investigue para projetar a solução nem altere código.

### Objetivo

Crie ou atualize somente o arquivo `docs/change-sets/cs-[ID]/planning-[titulo].md`, usando o modelo de planejamento. O `[titulo]` deve ser um slug em minúsculas, sem espaços e com `_` entre as palavras. Escreva em português do Brasil e use linguagem acessível a pessoas usuárias, negócio, suporte, produto, UX e engenharia.

O documento deve transformar a intenção da issue em um entendimento compartilhado do problema, sem antecipar a especificação técnica. Preserve a intenção e os fatos da issue, mas organize o conteúdo nas seções do modelo:

- problema e oportunidade;
- caso de uso e resultado esperado;
- contribuições e perspectivas;
- decisões e alinhamentos;
- dúvidas, riscos e validações necessárias;
- encaminhamento para especificação.

### Regras de interpretação

1. Trate a issue como fonte primária. Não invente requisitos, métricas, perfis, regras de negócio, decisões técnicas ou critérios que não estejam na issue ou em referências verificadas.
2. Diferencie claramente fato informado, decisão já tomada, hipótese, sugestão e dúvida em aberto.
3. Reescreva jargões em linguagem simples quando possível e preserve o termo original entre parênteses quando ele for necessário para localizar algo no projeto.
4. Converta pedidos vagos em perguntas de alinhamento; não responda às perguntas por conta própria.
5. Registre a origem das contribuições quando a issue indicar pessoa, área, comentário ou papel.
6. Mantenha fora de escopo tudo que a issue explicitamente excluir. Se não houver exclusões, registre somente limites que possam ser inferidos com segurança e marque o restante como dúvida.
7. Não transforme o planning em `specification-[titulo].md`: não defina endpoints, schema, arquivos de implementação, arquitetura, bibliotecas, comandos de teste ou checklist de implementação, salvo quando a issue trouxer uma decisão já existente. Nesse caso, registre-a como decisão ou restrição, sem expandi-la.
8. Não implemente nada, não crie testes, não faça commit e não atualize índice, árvore estrutural ou outros documentos.
9. Use nomes de arquivos e diretórios sem espaços; quando precisar sugerir um caminho, use minúsculas e `_` no lugar de espaços.

### Critério de conclusão

O trabalho está concluído quando `planning-[titulo].md`:

- representa fielmente a issue;
- pode ser lido por pessoas técnicas e não técnicas;
- separa decisões de dúvidas e hipóteses;
- explicita o valor esperado e os limites conhecidos;
- aponta as informações que ainda precisam ser alinhadas antes da especificação;
- está com status `em alinhamento` quando houver dúvida material ou `pronto para especificação` quando não houver bloqueio conhecido.

Ao final, informe apenas:

- caminho do arquivo criado ou atualizado;
- status atribuído;
- resumo das dúvidas ou riscos que ainda precisam de decisão;
- confirmação de que nenhum código ou outro documento foi alterado.
