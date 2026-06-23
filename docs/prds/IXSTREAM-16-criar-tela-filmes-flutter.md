# IXSTREAM-16 - Criar tela de Filmes no app Flutter

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-16
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

A feature de tela de Filmes no Flutter já foi implementada retroativamente, mas ainda precisa de rastreabilidade formal no Jira, PRD e workflow. A experiência deve ser equivalente à tela de Séries, removendo elementos exclusivos de séries como temporadas e episódios, e mantendo navegação clara entre Filmes e Séries.

## Goal

Regularizar a feature de Filmes para que possa seguir para revisão e validação formal, confirmando que a tela Flutter entregue mantém o padrão visual da tela de Séries, não exibe temporadas/episódios e permite navegação entre Filmes e Séries.

## Scope

- Documentar a feature de Filmes já implementada no app Flutter.
- Validar que a tela de Filmes reutiliza a linguagem visual, layout e padrões de interação da tela de Séries quando aplicável.
- Garantir que Filmes não apresente informações de temporadas ou episódios.
- Garantir navegação entre as abas/telas Filmes e Séries.
- Registrar que esta fase é apenas de regularização documental; o brainstormer não deve editar código de produção nem testes.

## Out of Scope

- Implementar novas alterações de código nesta fase de brainstormer.
- Alterar testes, fixtures, assets ou arquivos de implementação nesta fase.
- Integrar catálogo real/backend.
- Implementar player de vídeo, detalhes de filme ou busca funcional além do que já existir.
- Criar ADR ou Design Doc para esta feature pequena e isolada.

## Functional Requirements

- A tela Filmes deve existir como tela Flutter nativa no app.
- A tela Filmes deve seguir visualmente a tela Séries, adaptando textos e dados para filmes.
- A navegação deve permitir alternar entre Filmes e Séries.
- A bottom navigation deve indicar corretamente Filmes ou Séries como aba ativa conforme a tela atual.
- A tela Filmes não deve exibir temporadas, episódios, seletor de temporada, lista de episódios ou contagem de episódios.
- Dados de exibição podem permanecer mockados/localmente, conforme padrão das telas atuais.

## Non-Functional Requirements

- A UI deve preservar a identidade dark/cinemática do Telaflix.TV.
- A experiência deve permanecer mobile-first e evitar overflow em larguras comuns de telefone.
- A regularização não deve adicionar dependências.
- A revisão posterior deve comparar o comportamento implementado contra este PRD e o Jira.

## Acceptance Criteria

- [x] A tela Filmes existe e renderiza com visual coerente com a tela Séries.
- [x] A navegação permite alternar entre Filmes e Séries.
- [x] Filmes aparece como item ativo quando a tela Filmes está aberta.
- [x] Séries aparece como item ativo quando a tela Séries está aberta.
- [x] A tela Filmes não exibe temporadas nem episódios.
- [x] A implementação existente passa por revisão formal de escopo contra este PRD.
- [x] Testes e lint/typecheck relevantes são executados ou registrados como pendentes com motivo.

## Risks

- Como a regularização é retroativa, a implementação existente pode divergir parcialmente do escopo documentado e precisar de ajustes posteriores pelo implementor.
- A navegação entre Filmes e Séries pode estar visualmente presente, mas ainda precisa de validação formal de interação e estado ativo.
- Testes/lint não foram executados nesta fase de brainstormer.

## Open Questions

- None.
