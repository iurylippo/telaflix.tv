# IXSTREAM-14 - Criar tela de Series no app Flutter

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-14
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

O app Telaflix.TV possui Home, login, splash e bottom navigation, mas a aba Series ainda nao possui uma tela propria com a experiencia visual solicitada na referencia Stitch.

## Goal

Criar uma tela Flutter nativa para Series, em pt-BR, mobile-first, com busca, carrossel de series em destaque, chips de categorias, grade de posters e bottom navigation com Series ativa.

## Scope

- Implementar uma tela `SeriesScreen` nativa em Flutter.
- Usar dados mockados locais para destaques, categorias e posters.
- Reproduzir a direcao visual da referencia HTML Tailwind: fundo escuro, paleta premium, gradiente laranja/vermelho e cards cinematograficos.
- Incluir busca visual no topo da tela.
- Incluir carrossel horizontal `Series em Destaque` com cards widescreen.
- Incluir chips horizontais: Todas, Em alta, Drama, Acao, Anime, Comedia, Terror.
- Incluir grade `Explorar Series` com 3 colunas no mobile, cada card com nome e contagem de temporadas.
- Atualizar a navegacao inferior para cinco itens: Home, Filmes, Series, TV ao vivo e Perfil, com Series ativa na tela de Series.
- Preservar o comportamento atual da Home e o fluxo Splash -> Login -> Home.

## Out of Scope

- Integracao com backend ou catalogo real.
- Busca funcional com filtragem real.
- Player de video ou abertura de detalhes.
- Estado persistido de aba selecionada.
- Redesign completo da Home alem do necessario para tornar a bottom navigation reutilizavel.
- Suporte completo a tablet/desktop alem de evitar quebra visual e overflow.

## Functional Requirements

- A tela deve ser construida com widgets Flutter nativos, sem HTML embutido.
- A tela deve renderizar o titulo `Series` e um campo de busca visual no topo.
- A secao `Series em Destaque` deve exibir cards horizontais widescreen em carrossel.
- A lista de categorias deve rolar horizontalmente e destacar `Todas` como selecionada por padrao.
- A secao `Explorar Series` deve exibir posters em grade de 3 colunas no mobile.
- Cards devem exibir nome da serie e abaixo a quantidade de temporadas (ex: "3 temporadas").
- A bottom navigation deve indicar Series como item ativo na tela de Series.
- A Home deve continuar renderizando com Home ativa.

## Non-Functional Requirements

- A UI deve seguir a identidade escura/cinematica existente do Telaflix.
- A implementacao deve ser mobile-first e evitar overflow em larguras comuns de telefone.
- A solucao nao deve adicionar dependencias novas.
- O codigo deve seguir a estrutura atual por feature em `lib/src/features/...`.
- Widgets reutilizaveis devem permanecer pequenos e focados.

## Acceptance Criteria

- [x] `SeriesScreen` existe e renderiza a tela de Series em Flutter.
- [x] A tela mostra busca no topo, `Series em Destaque`, chips de categoria e `Explorar Series`.
- [x] A grade mobile usa 3 colunas para posters sem overflow.
- [x] Cards exibem nome da serie e quantidade de temporadas (ex: "3 temporadas" / "1 temporada").
- [x] A bottom navigation da tela de Series exibe Series como ativa.
- [x] A Home existente continua acessivel e com Home ativa.
- [x] Widget tests cobrem os principais textos, estado ativo da navegacao e responsividade basica.
- [x] `flutter test` e `dart analyze` passam em `src/telaflix_app`.

## Risks

- A referencia visual Stitch nao existe como arquivo no repositorio; o implementor deve usar a descricao e o HTML fornecido no ticket/conversa como fonte visual.
- A bottom navigation atual e stateful e local a Home, entao precisa virar componente parametrizavel sem quebrar testes existentes.
- A grade de 3 colunas pode gerar cards muito estreitos em dispositivos pequenos se espacamentos nao forem controlados.

## Open Questions

- None. Implementacao usa labels compactos `TV` e `Perfil` para evitar overflow em mobile.
