# Manutenção da documentação funcional

Os documentos em `docs/features/` descrevem o comportamento atual do sistema. Eles não devem repetir detalhes internos do código nem funcionar como diário de implementação.

Atualize um documento quando a mudança alterar:

- comportamento percebido por pessoas usuárias;
- regra de negócio;
- estados de erro relevantes;
- interface pública, evento ou integração;
- restrição importante da funcionalidade.

Não é necessário atualizar a documentação para refatorações sem mudança de comportamento, formatação ou manutenção interna.

Cada atualização deve incluir a referência à issue ou ao PR na seção “Evolução”. O Git preserva o diff completo; a tabela deve registrar apenas a mudança funcional relevante.

## Onde documentar

| Diretório | Conteúdo |
|---|---|
| `docs/features/` | Comportamento atual de funcionalidades, organizado por domínio. |
| `docs/guides/` | Instruções operacionais destinadas a pessoas. |
| `docs/methodology/` | Métodos e convenções de engenharia. |

Não crie um documento funcional por issue. Procure primeiro um arquivo existente do mesmo domínio e atualize-o; crie outro somente quando nenhuma documentação existente representar a funcionalidade.
