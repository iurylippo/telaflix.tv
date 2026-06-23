# Workflow State

## Metadata

- Jira ID: IXSTREAM-15
- Jira URL: https://iurylippo.atlassian.net/browse/IXSTREAM-15
- Title: Abrir detalhes da serie ao clicar em Series
- Slug: abrir-detalhes-serie
- Status: Implemented
- Owner: implementor
- Created At: 2026-06-23
- Updated At: 2026-06-23

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-15
- PRD: `docs/prds/IXSTREAM-15-abrir-detalhes-serie.md`
- Design Doc: Not required
- ADRs: Not required
- Branch:
- Pull Request:

## Affected Projects

- `src/telaflix_app/`

## Request

- O usuario pediu para usar o planner para a proxima feature: ao clicar em uma serie na tela de Series, abrir o conteudo/detalhes dela, baseado na referencia Stitch `web application/stitch/projects/6768824921457987006/screens/850a2cf55d324e7aa0976025c39fea0a` e no HTML fornecido.
- A tela de detalhes deve conter sinopse, selecao de temporada, episodios, elenco, sugestoes/series parecidas e visual dark Telaflix TV.

## Jira Summary

- IXSTREAM-15 criado via Jira MCP porque nao havia Jira ID no pedido e buscas por issues abertas relacionadas a detalhes/conteudo de series nao retornaram correspondencia.
- Status Jira: A fazer.
- Tipo: Historia.
- Prioridade: Medium.
- Assignee: unassigned.
- Jira description updated with PRD/workflow paths. Jira planning comment failed because the requested visibility role `Administrators` does not exist in this Jira project; the issue description remains synchronized.

## Clarified Scope

- Planner nao implementa codigo nesta fase.
- Escopo de implementacao futura: abrir detalhes de serie a partir de `SeriesScreen`, criar tela de detalhes com hero, sinopse, temporadas, episodios, elenco, series parecidas e bottom nav fixa.
- A referencia Stitch/HTML nao esta presente no repositorio; usar a descricao do usuario, PRD e Jira como fonte visual.

## Open Questions

- None. Usar dados mockados locais e comportamento visual para busca/CTA nesta primeira versao.

## Constraints

- Nao adicionar dependencias.
- Nao integrar backend/catalogo real.
- Nao implementar player de video nem persistencia real de progresso.
- Seguir estrutura Flutter existente por feature em `src/telaflix_app/lib/src/features/`.
- Comandos Flutter devem rodar a partir de `src/telaflix_app`, nao da raiz.

## Acceptance Criteria

- O toque em um card da tela de Series abre a tela de detalhes da serie selecionada.
- A tela de detalhes exibe header com voltar, Telaflix TV e busca.
- A tela exibe hero com chips, titulo, ano, temporadas, sinopse e botao `Continuar assistindo`.
- A tela exibe seletor de temporada e lista de episodios com numero, titulo, duracao, descricao e progresso quando houver.
- A tela exibe `Elenco` horizontal com avatar, nome e papel.
- A tela exibe `Series parecidas` horizontal com posters e nomes.
- O botao voltar retorna para `SeriesScreen`.
- A bottom navigation continua fixa e com `Series` ativo na experiencia de detalhes.
- Widget tests cobrem navegacao, conteudo principal, troca de temporada e responsividade basica.
- `flutter test` e `dart analyze` passam em `src/telaflix_app`.

## Documentation Decision

- PRD Required: Yes - created at `docs/prds/IXSTREAM-15-abrir-detalhes-serie.md`.
- ADR Required: No - isolated UI/navigation feature using existing Flutter patterns and no long-term technical decision.
- Design Doc Required: No - contained within the existing Series feature, using mock local data and no API/data model migration.

## Plan

- Architecture found: Flutter app in `src/telaflix_app` with `MaterialApp`, Splash/Login/Home flow, and feature folders under `lib/src/features/{feature}/{data,domain,presentation}`.
- Existing Series feature has `SeriesScreen`, domain models in `series_content.dart`, mock data in `mock_series_content.dart`, and widgets for search, featured cards, category chips, poster grid and poster cards.
- Current `SeriesScreen` renders `HomeBottomNav(selectedIndex: 2)` and static mock content; cards are display-only and do not expose tap callbacks.
- Current Home navigates to `SeriesScreen` by pushing a `PageRouteBuilder` fade transition from `HomeBottomNav` index 2.
- Plan for implementor:
- 1. Extend `series/domain/series_content.dart` with detail-oriented immutable models: `SeriesDetailContent`, `SeriesSeason`, `SeriesEpisode`, `SeriesCastMember`, and `RelatedSeriesItem`; keep fields minimal and Dart-native.
- 2. Extend `series/data/mock_series_content.dart` so poster/featured items can resolve to a matching detail object, preferably by adding stable `id` fields to clickable series items and a `Map<String, SeriesDetailContent>` or list lookup helper.
- 3. Create `series/presentation/series_detail_screen.dart` as a stateful screen only if season selection needs local state; otherwise use a small stateful season widget. Use `Scaffold` with dark background, `HomeBottomNav(selectedIndex: 2)`, and `CustomScrollView` body.
- 4. Create focused detail widgets under `series/presentation/widgets/` if the screen would exceed maintainable size: `series_detail_header.dart`, `series_detail_hero.dart`, `season_selector.dart`, `episode_list.dart`, `cast_member_card.dart`, and `related_series_card.dart`.
- 5. Update `series_poster_card.dart` and `featured_series_card.dart` to accept optional `VoidCallback onTap` or wrap cards in `InkWell`/`GestureDetector` with `HitTestBehavior.opaque`, preserving current visual output.
- 6. Update `series_poster_grid.dart` to accept a callback such as `ValueChanged<SeriesPosterItem> onPosterSelected` and pass it to each card.
- 7. Update `series_screen.dart` to push `SeriesDetailScreen(detail: ...)` for featured and poster cards. Use a simple helper in the screen to resolve details from the selected item's id/title.
- 8. Keep bottom nav behavior on the detail screen: `Series` remains active; tapping `Home` should either pop until Home when possible or mirror existing Series behavior by popping the Series route stack. Avoid introducing a router dependency.
- 9. Update `test/widget_test.dart` or split focused tests to assert navigation from a visible poster to details, detail header/hero/content sections, season switching, back button behavior, bottom nav active state, and no overflow on 375x812.

## Debate Notes

- Plan-reviewer optional because this is an isolated Flutter UI/navigation feature with no dependency, API, persistence, auth, or architecture changes.
- Simpler alternative considered: render details in a modal/bottom sheet. Rejected because the reference is a full content/detail screen with fixed header, hero, episodes, cast and suggestions.
- ADR not needed because the plan reuses existing `Navigator` and feature-folder patterns.

## Files To Change

- `src/telaflix_app/lib/src/features/series/domain/series_content.dart` - extend models with detail, season, episode, cast and related-series data.
- `src/telaflix_app/lib/src/features/series/data/mock_series_content.dart` - add local detail mocks and id/detail lookup data.
- `src/telaflix_app/lib/src/features/series/presentation/series_screen.dart` - wire card taps to details navigation.
- `src/telaflix_app/lib/src/features/series/presentation/series_detail_screen.dart` - create main detail screen.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/featured_series_card.dart` - add tap callback without changing visual design.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_poster_card.dart` - add tap callback/key semantics without changing visual design.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_poster_grid.dart` - propagate selected poster callback.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_detail_header.dart` - likely create for fixed top actions.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_detail_hero.dart` - likely create for hero/metadata/synopsis/CTA.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_episode_list.dart` - likely create for season selector and episode rows, or split if large.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/series_cast_section.dart` - likely create for horizontal cast list.
- `src/telaflix_app/lib/src/features/series/presentation/widgets/related_series_section.dart` - likely create for horizontal related posters.
- `src/telaflix_app/test/widget_test.dart` - add/adjust widget tests for navigation, detail content, season switching and responsive layout.

## Implementation Notes

- Domain models extended with `SeriesDetailContent`, `SeriesSeason`, `SeriesEpisode`, `SeriesCastMember`, `RelatedSeriesItem` and `id` fields on `FeaturedSeriesItem`/`SeriesPosterItem`.
- Mock data expanded with 8 full detail entries (lookup map `mockSeriesDetails`) matching all series in the grid/featured lists.
- `SeriesDetailScreen` created as `StatefulWidget` with season selection via `_selectedSeasonIndex`.
- Created 5 focused detail widgets: `SeriesDetailHeader`, `SeriesDetailHero`, `SeriesEpisodeList`, `SeriesCastSection`, `RelatedSeriesSection`.
- `FeaturedSeriesCard` and `SeriesPosterCard` now accept optional `onTap` callbacks wrapped in `GestureDetector` with `HitTestBehavior.opaque`.
- `SeriesPosterGrid` accepts `onPosterSelected` callback and propagates to each card.
- `SeriesScreen` wires featured and poster taps to push `SeriesDetailScreen` via `PageRouteBuilder` fade transition, using `mockSeriesDetails` lookup by `id`.
- Bottom nav on detail screen: Series (index 2) active; Home (index 0) pops to root.
- `dart analyze`: No issues found.
- `flutter test`: 17/17 tests pass including navigation, detail sections, season switching, fixed-height scrollable episode container, back button, bottom nav, and narrow-screen overflow.

### Ajuste: container scrollavel de episodios (2026-06-23)

- `SeriesEpisodeList`: substituido `for` loop de episodios por `SizedBox(height: 580)` com `Container` (card escuro com borda e border-radius 16) contendo `ListView.separated` interno, garantindo ~4 episodios visiveis e scroll interno para temporadas longas.
- Adicionado Key `episode-scrollable-container` ao Container para verificacao em testes.
- Teste adicionado: `episode list has a fixed-height scrollable container` — verifica presenca do container, altura fixa de 580px e scrollable interno.
- `dart analyze`: No issues found.
- `flutter test`: 17/17 tests pass.

## Review Findings

- Not run in planner phase. Code review required after implementor changes.

## Test Results

- `flutter test` from `src/telaflix_app`: **17/17 passed** (2026-06-23).
- Tests cover navigation from Series to details, detail sections, season switching, fixed-height scrollable episode container, back button, bottom nav active state, and narrow-screen overflow.

## Security Findings

- No auth, credential, storage, backend, or dependency changes planned.

## Lint Results

- `dart analyze` from `src/telaflix_app`: **No issues found** (2026-06-23).

## Implementation Start Gate

- Jira Issue: IXSTREAM-15
- In Active Sprint: no - JQL `key = IXSTREAM-15 AND sprint in openSprints()` returned no issues.
- In Any Sprint: no - JQL `key = IXSTREAM-15 AND sprint is not EMPTY` returned no issues.
- Assignee: unassigned
- Status: A fazer
- Decision: implementation blocked until the issue is in an active sprint, has an assignee, and the user explicitly invokes or approves `@implementor`.

## Final Checklist

- [x] Jira task linked
- [x] Jira issue read through MCP
- [x] PRD created or updated
- [x] Jira updated with PRD path
- [x] ADR created if needed
- [x] Jira updated with ADR path if ADR exists
- [x] Design Doc created if needed
- [x] Jira updated with Design Doc path if Design Doc exists
- [x] Scope approved
- [x] Plan approved
- [x] Implementation completed
- [x] Review completed
- [x] Tests run or explicitly skipped with reason
- [x] Lint/typecheck run or explicitly skipped with reason
- [x] PRD acceptance criteria checked/resolved before finalization
- [x] PRD and Design Doc open questions resolved before finalization
- [x] commit-message
- [ ] Jira commented with implementation/test summary
- [ ] Commit created after explicit approval
- [ ] Push completed after explicit approval
- [ ] Workflow archived

## Commit Message Draft

```text
feat(ui): add series detail screen with hero, seasons, episodes, cast and related series [IXSTREAM-15]
```

## Pull Request Description Draft

```markdown
## Summary

- Add series detail screen opened from series cards on SeriesScreen, with hero, synopsis, metadata, season selector, episode list, cast section, and related series.

## Changes

- **Domain**: Extended `series_content.dart` with `SeriesDetailContent`, `SeriesSeason`, `SeriesEpisode`, `SeriesCastMember`, `RelatedSeriesItem`.
- **Data**: Expanded `mock_series_content.dart` with 8 full detail entries and a lookup map.
- **UI**: Created `SeriesDetailScreen` (stateful with season selection) and 5 focused widgets: `SeriesDetailHeader`, `SeriesDetailHero`, `SeriesEpisodeList`, `SeriesCastSection`, `RelatedSeriesSection`.
- **Navigation**: Added `onTap` callbacks to `FeaturedSeriesCard`, `SeriesPosterCard`, and `SeriesPosterGrid`; wired to push `SeriesDetailScreen` via fade transition.
- **Episodes container**: Fixed-height scrollable container (`SizedBox(height: 580)`) inside a dark card, showing ~4 episodes visible with internal scroll for long seasons.
- **Tests**: 17 widget tests covering navigation, detail sections, season switching, back button, bottom nav, and narrow-screen overflow.

## Verification

- `dart analyze` — No issues found.
- `flutter test` — 17/17 passed.

## Known Issues / Pre-existing Failures

- None identified.

## Manual QA

- Navigate to Series screen, tap any poster or featured card → detail screen opens.
- Verify hero, synopsis, metadata chips, and CTA button render.
- Switch seasons via dropdown → episodes update.
- Scroll episode container internally on long seasons.
- Tap back button → returns to SeriesScreen.
- Bottom nav shows Series (index 2) active; Home pops to root.

## Documentation

- PRD: `docs/prds/IXSTREAM-15-abrir-detalhes-serie.md`
- Workflow: `.agents/workflow/current.md`
```

## Finalization Plan

- Branch: `main`
- Upstream: `origin/main`
- Push Target: `origin/main`
- Files To Commit: All implementation files for IXSTREAM-15 (see Files To Change above), updated workflow, and workflow archive.
- Commit Message: `feat(ui): add series detail screen with hero, seasons, episodes, cast and related series [IXSTREAM-15]`
- Documentation Final Sync: PRD status set to "Implemented", acceptance criteria checked, open questions resolved. Design Doc/ADR not required.
- Jira Final Comment: Will summarize implementation (17/17 tests, dart analyze clean, detail screen with all sections, scrollable episode container).
- Workflow Archive: `.agents/workflow/archive/IXSTREAM-15-abrir-detalhes-serie.md`

## Finalization Results

- Commit:
- Push:
- Jira Update:
- Workflow Archive:
