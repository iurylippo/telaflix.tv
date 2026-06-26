# IXSTREAM-17 - Criar tela de TV Ao Vivo no app Flutter

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-17
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

O app Flutter precisa de uma tela nativa de TV Ao Vivo para completar a navegação principal e refletir o mock Stitch/HTML fornecido, mantendo a identidade dark/cinemática do Telaflix.TV.

## Goal

Entregar uma tela mobile-first de TV Ao Vivo acessível pelo item TV do menu inferior, com busca visual, destaques horizontais, categorias e lista de canais, sem integrar backend real ou player nesta etapa.

## Scope

- Criar tela “TV Ao Vivo” baseada na referência Stitch/HTML fornecida na conversa.
- Exibir busca no topo com placeholder para canais/programas.
- Exibir cards destacados em seção horizontal.
- Exibir chips de categoria, incluindo Todos, Abertos, Filmes, Esportes, Notícias e Kids.
- Exibir lista de canais com logo/ícone, nome e metadados visuais suficientes para o layout.
- Mostrar o item TV como ativo no bottom nav.
- Integrar seleção/navegação pelo `HomeBottomNav` ou menu TV existente.

## Out of Scope

- Backend, catálogo real ou integração com APIs.
- Player ao vivo ou reprodução de streaming.
- Busca funcional com filtro real, salvo se houver padrão local simples já usado no app.
- Autenticação, autorização, permissões ou mudanças de conta.
- ADR, Design Doc, produção de assets finais, ou alterações fora da UI necessária.

## Functional Requirements

- A tela TV Ao Vivo deve renderizar no app Flutter com visual coerente com a referência Stitch/HTML.
- A busca deve ficar visível no topo da tela.
- Os cards destacados devem aparecer em rolagem horizontal.
- Os chips de categoria devem aparecer em rolagem horizontal e indicar categoria selecionada.
- A lista de canais deve apresentar entradas legíveis em layout mobile.
- O bottom nav deve indicar TV como item ativo quando a tela estiver aberta.
- O menu TV existente deve navegar para ou selecionar a tela TV Ao Vivo sem quebrar Home, Filmes e Séries.

## Non-Functional Requirements

- A UI deve preservar a identidade dark/cinemática do Telaflix.TV.
- A tela deve ser mobile-first e evitar overflows em larguras comuns de telefone.
- A implementação não deve adicionar dependências sem aprovação explícita.
- Dados podem ser mockados/localmente conforme padrão das telas atuais.

## Acceptance Criteria

- [x] A tela TV Ao Vivo existe e é acessível pelo item TV do bottom nav/menu.
- [x] O bottom nav mostra TV como ativo na tela TV Ao Vivo.
- [x] A busca no topo aparece com placeholder para canais/programas.
- [x] Os cards destacados são exibidos horizontalmente.
- [x] Os chips de categoria são exibidos horizontalmente com estado selecionado padrão.
- [x] A lista de canais renderiza entradas mobile-friendly com logo/ícone e nome.
- [x] A navegação entre Home, Filmes, Séries e TV permanece funcional.
- [x] Testes e lint/typecheck relevantes são executados ou registrados com motivo se não forem executados.

## Risks

- A referência Stitch/HTML pode exigir ajustes para adaptar proporções e espaçamentos ao Flutter/mobile.
- A integração com o bottom nav pode depender do estado atual de navegação das telas Home, Filmes e Séries.
- Se dados mockados forem duplicados sem padrão existente, pode haver necessidade de refatoração posterior.

## Open Questions

- None.
