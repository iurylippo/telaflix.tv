# IXSTREAM-18 - Criar tela de detalhes de canal no Flutter

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-18
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

Ao selecionar um canal de TV Ao Vivo, o app Flutter precisa abrir uma tela nativa de detalhes que apresente o canal em destaque, uma área de player ao vivo e a programação/EPG. A referência visual disponível é o HTML Stitch fornecido pelo usuário; o caminho Stitch/imagem não está acessível localmente.

## Goal

Entregar uma tela mobile-first de detalhes de canal coerente com a identidade dark/cinemática do Telaflix.TV, usando o HTML fornecido como referência visual.

## Scope

- Criar uma tela Flutter nativa de detalhes de canal.
- Permitir navegação a partir de um canal da tela TV Ao Vivo, seguindo os padrões existentes do app.
- Exibir área superior de vídeo/player ao vivo usando player Flutter nativo com fonte mockada.
- Exibir informações do canal e botão de tela cheia.
- Exibir seção “Programação”/EPG com programa atual destacado e próximos programas em timeline/lista.
- Usar dados locais/mockados quando dados reais de canal, player ou EPG não estiverem disponíveis.

## Out of Scope

- Integração real de streaming, backend, APIs ou EPG remoto.
- Provider real de vídeo, DRM, autenticação, autorização ou permissões.
- Adição de dependências sem aprovação explícita.
- Mudanças amplas de arquitetura, Design Doc ou ADR.

## Functional Requirements

- Ao tocar em um canal de TV Ao Vivo, o usuário deve acessar a tela de detalhes do canal.
- A tela deve renderizar um player/live video no topo com fonte mockada e controles/ícones visuais adequados à referência.
- A tela deve mostrar nome e metadados do canal.
- A tela deve mostrar um botão de tela cheia visível.
- A tela deve mostrar a seção “Programação” com programa atual destacado e próximos programas.
- A UI deve ser construída em Flutter nativo, não como WebView/HTML embutido.

## Non-Functional Requirements

- Visual dark/cinemático consistente com Telaflix.TV e telas Flutter existentes.
- Layout mobile-first sem overflows em larguras comuns de telefone.
- Implementação focada em UI e navegação local, com mudanças pequenas e isoladas.
- Não expor URLs, tokens, credenciais ou dados sensíveis em código, docs, Jira ou workflow.

## Acceptance Criteria

- [x] Ao selecionar um canal de TV Ao Vivo, a tela de detalhes do canal é aberta.
- [x] A tela exibe área superior de vídeo/player ao vivo visualmente coerente com a referência HTML.
- [x] A tela exibe informações do canal e botão de tela cheia.
- [x] A tela exibe seção Programação/EPG com programa atual e próximos programas.
- [x] A tela mantém visual dark, mobile-first e não apresenta overflow em larguras comuns.
- [x] A navegação existente entre telas principais não é quebrada.
- [x] Testes e lint/typecheck relevantes são executados ou registrados com motivo se não forem executados.

## Risks

- A referência HTML pode exigir adaptação de proporções, sombras e espaçamentos para Flutter/mobile.
- Se a tela de TV Ao Vivo atual ainda usa dados locais simples, a navegação para detalhes pode precisar ampliar modelos mockados.
- O botão de tela cheia pode precisar ficar visual/no-op nesta etapa se não houver player real ou padrão de fullscreen existente.

## Open Questions

- None. O botão de tela cheia fica visual/no-op nesta etapa, conforme escopo aprovado.
