# IXSTREAM-13 - Adaptar menu inferior Flutter ao mockup Stitch

## Status

Implemented - Pending QA

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-13
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

O menu inferior atual da Home Flutter ainda não reflete o conjunto de abas solicitado no mockup Stitch para a experiência principal do Telaflix.

## Goal

Atualizar a navegação inferior da Home para exibir as abas Home, Filmes, Series e TV, mantendo Home como a única tela funcional nesta etapa e preservando o visual escuro/cinemático do app.

## Scope

- Atualizar o menu inferior do app Flutter.
- Exibir exatamente quatro itens, nesta ordem: Home, Filmes, Series, TV.
- Manter Home como aba ativa e funcional.
- Permitir que Filmes, Series e TV sejam destinos/abas placeholder sem tela completa.
- Preservar a identidade visual escura/cinemática já usada na Home.

## Out of Scope

- Implementar telas completas de Filmes, Series ou TV.
- Integrar dados reais, backend, player ou catálogo.
- Alterar o fluxo de login, splash ou autenticação.
- Redesenhar toda a Home além do menu inferior.

## Functional Requirements

- A bottom navigation deve renderizar os itens Home, Filmes, Series e TV.
- Home deve permanecer selecionada inicialmente.
- Os itens placeholder devem aceitar toque sem quebrar a tela atual.
- O estado visual selecionado/inativo deve ser claro e coerente com o mockup Stitch.
- A Home existente deve continuar acessível e funcional.

## Non-Functional Requirements

- A implementação deve seguir padrões Flutter nativos existentes no projeto.
- A mudança não deve adicionar dependências.
- O layout deve evitar overflow em telas mobile comuns.
- O visual deve permanecer alinhado ao tema premium escuro do Telaflix.

## Acceptance Criteria

- [x] A navegação inferior exibe Home, Filmes, Series e TV nessa ordem.
- [x] Home continua renderizando a experiência atual funcional.
- [x] Filmes, Series e TV existem como destinos/abas placeholder sem exigir telas completas.
- [x] A seleção de aba é visualmente clara via estado ativo/inativo testado por widget tests.
- [ ] Consistência visual completa com o mockup Stitch validada em QA manual.
- [x] O menu preserva a identidade escura/cinemática do Telaflix.
- [x] A mudança não quebra o fluxo atual de abertura da Home.

## Risks

- A navegação placeholder pode criar expectativa de telas completas se não houver feedback visual suficiente.
- Ajustes de labels podem impactar testes existentes que verificam textos antigos do menu.

## Open Questions

- None
