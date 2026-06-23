# IXSTREAM-15 - Abrir detalhes da serie ao clicar em Series

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-15
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

A tela de Series exibe carrosseis e posters, mas os cards ainda nao abrem uma experiencia de conteudo. O usuario precisa clicar em uma serie e visualizar detalhes como sinopse, temporadas, episodios, elenco e series parecidas.

## Goal

Adicionar uma tela Flutter nativa de detalhes da serie, aberta a partir da tela de Series, seguindo a referencia Stitch dark Telaflix TV indicada pelo usuario.

## Scope

- Tornar cards de series clicaveis na tela `SeriesScreen`.
- Abrir uma tela de detalhes/conteudo da serie selecionada.
- Exibir header fixo com botao voltar, marca Telaflix TV e busca.
- Exibir hero alto com imagem/gradiente, chips, titulo, ano, quantidade de temporadas, sinopse e CTA `Continuar assistindo`.
- Exibir seletor de temporada, contagem de episodios e lista de episodios com thumbnail, numero, titulo, duracao, descricao e barra de progresso quando aplicavel.
- A lista de episodios deve ficar dentro de um card/area de altura fixa, mostrando cerca de 4 episodios visiveis e permitindo scroll interno para temporadas longas.
- Exibir secao horizontal `Elenco` com avatar circular, nome e papel.
- Exibir secao horizontal `Series parecidas` com posters e nomes.
- Manter bottom navigation fixa no estilo atual do app.

## Out of Scope

- Integracao com backend/catalogo real.
- Player de video funcional.
- Persistencia real de progresso ou temporada selecionada.
- Busca funcional no header de detalhes.
- Adicao de dependencias ou assets remotos obrigatorios.
- Redesign amplo da Home ou da navegacao fora do necessario para abrir detalhes.

## Functional Requirements

- Ao tocar/clicar em uma serie na tela de Series, o app deve navegar para a tela de detalhes da serie correspondente.
- A tela de detalhes deve renderizar os dados da serie selecionada a partir de mocks locais.
- O botao voltar do header deve retornar para a tela de Series.
- O seletor de temporada deve permitir alternar os episodios exibidos quando houver mais de uma temporada no mock.
- Episodios com progresso devem mostrar barra visual; episodios sem progresso devem omitir ou mostrar progresso zerado de forma consistente.
- A lista de episodios deve usar uma area scrollavel interna de altura fixa para evitar crescimento indefinido da tela.
- As secoes `Elenco` e `Series parecidas` devem rolar horizontalmente e preservar o visual dark/cinematografico.

## Non-Functional Requirements

- A solucao deve seguir a estrutura atual por feature em `lib/src/features/series/`.
- A implementacao deve ser mobile-first e evitar overflow em largura de telefone comum.
- A tela deve usar Flutter nativo, sem HTML embutido.
- A implementacao nao deve adicionar dependencias novas.
- Os widgets devem permanecer pequenos e focados.
- Dados de referencia devem permanecer mockados/localizados no modulo de series.

## Acceptance Criteria

- [x] O toque em um card da tela de Series abre a tela de detalhes da serie selecionada.
- [x] A tela de detalhes exibe header com voltar, Telaflix TV e busca.
- [x] A tela exibe hero com chips, titulo, ano, temporadas, sinopse e botao `Continuar assistindo`.
- [x] A tela exibe seletor de temporada e lista de episodios com numero, titulo, duracao, descricao e progresso quando houver.
- [x] A lista de episodios fica em card/area de altura fixa com scroll interno para temporadas longas.
- [x] A tela exibe `Elenco` horizontal com avatar, nome e papel.
- [x] A tela exibe `Series parecidas` horizontal com posters e nomes.
- [x] O botao voltar retorna para `SeriesScreen`.
- [x] A bottom navigation continua fixa e com `Series` ativo na experiencia de detalhes.
- [x] Widget tests cobrem navegacao, conteudo principal, troca de temporada e responsividade basica.
- [x] `flutter test` e `dart analyze` passam em `src/telaflix_app`.

## Risks

- A referencia Stitch/HTML nao esta versionada no repositorio; o implementor deve usar a descricao deste PRD, Jira e conversa como fonte visual.
- Os modelos atuais de `SeriesPosterItem` e `FeaturedSeriesItem` sao simples; a feature exige novos dados de detalhe sem transformar a estrutura em excesso.
- A bottom navigation ja fica no `Scaffold`; a tela de detalhes deve evitar conflito entre header fixo, conteudo rolavel e bottom nav.
- A lista de episodios pode gerar overflow se thumbnails e textos nao forem limitados em telas estreitas.

## Open Questions

- None. Usar mocks locais e comportamento visual para busca/CTA nesta primeira versao.
