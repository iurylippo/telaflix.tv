# Workflow State

## Metadata

- Jira ID: IXSTREAM-17
- Jira URL: https://iurylippo.atlassian.net/browse/IXSTREAM-17
- Title: Criar tela de TV Ao Vivo no app Flutter
- Slug: criar-tela-tv-ao-vivo-flutter
- Status: Implementado
- Owner: implementor
- Created At: 2026-06-25
- Updated At: 2026-06-26

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-17
- PRD: `docs/prds/IXSTREAM-17-criar-tela-tv-ao-vivo-flutter.md`
- Design Doc:
- ADRs: Not required
- Branch:
- Pull Request:

## Affected Projects

- `src/telaflix_app/`

## Request

- User requested brainstormer setup for Jira IXSTREAM-17, “Criar tela de TV Ao Vivo no app Flutter”, based on Stitch path `web application/stitch/projects/6768824921457987006/screens/ef3b36ecfad8434399ffa69ba9f23cab` and HTML provided in the conversation. Do not use or offer visual companion. Do not edit production code or tests.

## Jira Summary

- Jira IXSTREAM-17 was read through Jira MCP. Issue type: Tarefa. Status: A fazer. Priority: Medium. Labels: feature, flutter. Assignee: Iury Vieira Lippo da Silva. Scope matches the requested Flutter TV Ao Vivo UI screen with Stitch/HTML reference, top search, horizontal highlights, category chips, channel list, active TV bottom nav, and integration with existing Home/Filmes/Séries/TV navigation.
- Jira description was updated with PRD/workflow paths. Jira comment attempts failed because the provided comment visibility roles were not available in this Jira project; documentation paths are present in the issue description instead.

## Clarified Scope

- Create a TV Ao Vivo screen for the Flutter app menu.
- Include visual search at the top.
- Include horizontal highlighted cards.
- Include category chips.
- Include a channel list.
- Bottom nav must show TV as active.
- Integrate navigation through HomeBottomNav/menu TV.
- Scope is UI-only and isolated; no backend/player integration in this phase.
- Brainstormer phase must not edit production code or tests.

## Open Questions

- None.

## Constraints

- Must follow AGENTS.md Jira-first workflow.
- Use Jira issue ID IXSTREAM-17 as canonical identifier for PRD path and workflow.
- No visual companion.
- No production/test implementation edits in brainstormer phase.

## Acceptance Criteria

- TV Ao Vivo screen renders in Flutter with the expected dark/cinematic visual direction from the Stitch/HTML reference.
- Search field is visible at the top.
- Highlighted TV/channel cards appear in a horizontal section.
- Category chips are horizontally available and include a default selected state.
- Channel list is visible with channel entries suitable for mobile.
- Bottom navigation shows TV active on the TV screen.
- HomeBottomNav/menu TV can navigate to or select the TV screen without breaking existing Home/Filmes/Séries flows.

## Documentation Decision

- PRD Required: yes; created at `docs/prds/IXSTREAM-17-criar-tela-tv-ao-vivo-flutter.md`
- ADR Required: no; this is an isolated UI screen and does not introduce a long-term architectural decision
- Design Doc Required: no; task is small, isolated, UI-only, and low-risk

## Plan

- Create an isolated `live_tv` feature under `src/telaflix_app/lib/src/features/live_tv/`, mirroring the existing `movies` and `series` feature structure instead of introducing shared abstractions during this task.
- Add local mock data only: define typed content models for featured live cards, category chips, and channel list entries; populate mock data with Stitch-inspired labels/categories from the PRD (`Todos`, `Abertos`, `Filmes`, `Esportes`, `Notícias`, `Kids`) and channel metadata suitable for UI rendering.
- Build `LiveTvScreen` as a mobile-first `Scaffold` with dark `Color(0xFF09090D)`, `SafeArea`, `CustomScrollView`, and `HomeBottomNav(selectedIndex: 3)` to match Movies/Series screen structure.
- Implement the visual sections from the Stitch HTML reference: title `TV Ao Vivo`, top visual search field, horizontal featured cards, horizontal chips with default selected state, and a vertical channel list.
- Keep the search visual-only in this phase; do not add filtering/search logic unless explicitly requested later, because PRD marks functional search out of scope.
- Integrate bottom-nav navigation consistently across Home, Movies, Series, Movies detail, Series detail, and TV so index 0 returns to Home, index 1 opens Filmes, index 2 opens Séries, and index 3 opens TV without breaking existing flows.
- Prefer the existing fade `PageRouteBuilder<void>` pattern for all new cross-tab pushes. For non-home screens/details, pop to first route before pushing another top-level tab to preserve existing regression behavior that returning Home removes intermediate tab screens.
- Avoid backend, player, new dependencies, assets, authentication, authorization, and root-level files.
- Implementation start gate before code edits: `IXSTREAM-17` is assigned, but implementor should check active sprint with JQL `key = IXSTREAM-17 AND sprint in openSprints()` and only edit after the user explicitly invokes or approves `@implementor`.

## Debate Notes

- Plan-reviewer is optional for this task because scope is isolated UI-only, ADR and Design Doc are not required, and existing Movies/Series patterns provide direct implementation precedent.
- Simpler alternative considered: add the TV screen UI directly inside `home_screen.dart`. Rejected because Movies and Series already use feature folders with domain/data/presentation separation, and a standalone `live_tv` feature keeps the navigation target maintainable without broad refactor.
- Shared bottom-nav navigation helper considered. Rejected for this task to avoid introducing an abstraction while existing screens already duplicate simple tab handling; implementor can add only direct index 3 handling unless duplication becomes error-prone during review.

## Files To Change

- Create: `src/telaflix_app/lib/src/features/live_tv/domain/live_tv_content.dart`
  - Responsibility: typed UI-only models such as `LiveTvContent`, `FeaturedLiveTvItem`, `LiveTvCategoryItem`, and `LiveTvChannelItem`.
- Create: `src/telaflix_app/lib/src/features/live_tv/data/mock_live_tv_content.dart`
  - Responsibility: local mock content for highlighted live cards, categories, and channels. Use no network calls and no assets; represent logos with icons/colors/text.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/live_tv_screen.dart`
  - Responsibility: screen composition, `Key('live-tv-screen')`, section layout, `HomeBottomNav(selectedIndex: 3)`, and tab navigation from TV to Home/Filmes/Séries.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/widgets/live_tv_search_bar.dart`
  - Responsibility: visual top search control with placeholder for channels/programs, matching the dark rounded input pattern from Movies/Series while using TV-specific copy.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/widgets/live_tv_featured_card.dart`
  - Responsibility: horizontal highlighted card UI with gradient/accent, live indicator, title, subtitle/program metadata, and TV icon treatment inspired by the Stitch reference.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/widgets/live_tv_category_chips.dart`
  - Responsibility: horizontally scrollable selectable chips; follow `MoviesCategoryChips`/`SeriesCategoryChips` local state pattern.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/widgets/live_tv_channel_list.dart`
  - Responsibility: vertical channel list composition using `LiveTvChannelItem` entries.
- Create: `src/telaflix_app/lib/src/features/live_tv/presentation/widgets/live_tv_channel_tile.dart`
  - Responsibility: single mobile-friendly channel row/card with logo/icon placeholder, channel name, current program, tag/category, live badge, and no overflow.
- Modify: `src/telaflix_app/lib/src/features/home/presentation/home_screen.dart`
  - Add import for `LiveTvScreen` and handle `HomeBottomNav` index 3 with the same fade route used for Filmes/Séries.
- Modify: `src/telaflix_app/lib/src/features/movies/presentation/movies_screen.dart`
  - Add index 3 handling to open `LiveTvScreen`, preferably after `popUntil((route) => route.isFirst)` for top-level tab consistency.
- Modify: `src/telaflix_app/lib/src/features/series/presentation/series_screen.dart`
  - Add index 3 handling to open `LiveTvScreen`, preferably after `popUntil((route) => route.isFirst)` for top-level tab consistency.
- Modify: `src/telaflix_app/lib/src/features/movies/presentation/movies_detail_screen.dart`
  - Add index 3 handling to return to root and open `LiveTvScreen`, matching existing detail-to-Series behavior.
- Modify: `src/telaflix_app/lib/src/features/series/presentation/series_detail_screen.dart`
  - Add index 3 handling to return to root and open `LiveTvScreen`, matching existing detail-to-Movies behavior.
- Modify: `src/telaflix_app/test/widget_test.dart`
  - Add focused widget/navigation coverage for TV screen rendering, active bottom nav, Home -> TV navigation, TV -> Filmes/Séries/Home navigation, category chip selection, and narrow-screen overflow regression.

## Implementation Notes

- All 13 planned files created/modified (7 new + 5 modified + 1 test).
- Domain models created at `live_tv/domain/live_tv_content.dart`: `LiveTvContent`, `FeaturedLiveTvItem`, `LiveTvCategoryItem`, `LiveTvChannelItem`.
- Mock data at `live_tv/data/mock_live_tv_content.dart`: 3 featured channels, 6 categories (Todos/Abertos/Filmes/Esportes/Noticias/Kids), 10 channels.
- Screen `LiveTvScreen` at `live_tv/presentation/live_tv_screen.dart`: Scaffold with `CustomScrollView`, `SafeArea`, dark `Color(0xFF09090D)` background, `HomeBottomNav(selectedIndex: 3)`.
- Widgets: `LiveTvSearchBar` (visual-only with placeholder), `LiveTvFeaturedCard` (horizontal, with live badge), `LiveTvCategoryChips` (selectable, matches Movies/Series pattern), `LiveTvChannelTile` (icon+name+program+live badge), `LiveTvChannelList` (vertical column).
- Navigation integrated in Home, Movies, Series, MoviesDetail, SeriesDetail: all handle index 3 with fade `PageRouteBuilder`, detail screens use `popUntil(first)` before pushing.
- No new dependencies, no backend, no player, no assets, no auth changes.
- Tests added: 13 focused widget/navigation tests covering rendering, bottom nav, navigation from all screens, overflow, chips, search bar, featured cards, channel list.
- `flutter analyze`: No issues found.
- `flutter test test/widget_test.dart`: All 49 tests passed (36 existing + 13 new).

- **Reviewer findings fix (2026-06-26):**
  - `LiveTvScreen.onItemSelected` now handles index 1 → MoviesScreen and index 2 → SeriesScreen via fade `PageRouteBuilder`, matching existing MoviesScreen/SeriesScreen top-level tab pattern.
  - Two new tests added: `LiveTvScreen -> MoviesScreen ao tocar bottom-nav-filmes` and `LiveTvScreen -> SeriesScreen ao tocar bottom-nav-series`.
  - `flutter test test/widget_test.dart`: All 51 tests passed (49 existing + 2 new).

- Visual direction for implementor: preserve Telaflix dark/cinematic style already used in Home/Movies/Series; adapt the Stitch HTML elements into Flutter widgets rather than copying web/CSS structure literally.
- Data strategy: use static const mock data in `mock_live_tv_content.dart`; no backend, no player, no asset pipeline, no generated files.
- Navigation strategy: treat TV as another top-level tab at bottom-nav index 3; keep Perfil index 4 untouched and non-functional unless separately scoped.

## Review Findings

- Re-review after correction (2026-06-26): no remaining reviewer findings.
- Verified by code review: `LiveTvScreen` now handles TV -> Filmes (`bottom-nav-filmes`) and TV -> Séries (`bottom-nav-series`) with fade `PageRouteBuilder` routes to `MoviesScreen` and `SeriesScreen`.
- Verified by code review: TV screen scope remains UI-only and includes the expected dark/cinematic scaffold, top search placeholder, horizontal highlighted cards, horizontal category chips with default selected state, mobile channel list, and active TV bottom nav.
- Verified by code review: Home/Filmes/Séries/details -> TV integration remains present, and tests now include the previously missing TV -> Filmes and TV -> Séries navigation coverage.
- Verified by code review: no backend calls, player integration, new dependency usage, new assets, auth/authorization changes, or storage/credential changes were introduced for this task.
- Reviewer did not re-run tests; workflow implementation notes report `flutter test test/widget_test.dart` passing with all 51 tests after the correction.

## Test Results

- `flutter test test/widget_test.dart` from `src/telaflix_app`: implementation notes report all 51 tests passed after correction; reviewer did not re-run this command.
- 15 Live TV tests present after correction: rendering, bottom nav active state, TV→Home, Home→TV, Movies→TV, Series→TV, MoviesDetail→TV, SeriesDetail→TV, narrow-screen overflow, category chip selection, search bar, featured cards, TV→Filmes, TV→Séries, and channel list.

## Security Findings

- No security findings from re-review. The Live TV implementation remains local mock-data/UI-only; no credentials, auth/authorization, backend calls, player, stream URLs, storage access, or new dependencies were introduced.

## Lint Results

- `flutter analyze` from `src/telaflix_app` (26/06/2026): No issues found. Exit code 0. Duration: 1.5s.

## Final Checklist

- [x] Jira task linked
- [x] Jira issue read through MCP
- [x] PRD created or updated
- [x] Jira updated with PRD path
- [ ] ADR created if needed
- [ ] Jira updated with ADR path if ADR exists
- [ ] Design Doc created if needed
- [ ] Jira updated with Design Doc path if Design Doc exists
- [x] Scope approved
- [x] Plan approved
- [x] Implementation completed
- [x] Review completed
- [x] Tests run or explicitly skipped with reason
- [x] Lint/typecheck run or explicitly skipped with reason
- [x] PRD acceptance criteria checked/resolved before finalization
- [x] PRD and Design Doc open questions resolved before finalization
- [ ] Jira commented with implementation/test summary
- [ ] Commit created after explicit approval
- [ ] Push completed after explicit approval
- [ ] Workflow archived

## Agent Progress

- [x] commit-message

## Commit Message Draft

- `feat(ui): add live TV screen with bottom nav integration [IXSTREAM-17]`

## Pull Request Title Draft

- `[IXSTREAM-17] Criar tela de TV Ao Vivo no app Flutter`

## Pull Request Description Draft

```md
## Summary

- Implements the Flutter TV Ao Vivo screen from the Stitch reference and connects it to the existing bottom navigation.

## Changes

- Added the `live_tv` feature with typed mock data, TV screen composition, search UI, featured cards, category chips, and channel list widgets.
- Connected TV navigation from Home, Filmes, Séries, Filmes detail, and Séries detail screens.
- Added TV -> Filmes and TV -> Séries navigation from the TV screen.
- Added widget tests for TV rendering, active bottom nav state, cross-navigation, category chips, featured cards, channel list, and narrow-screen behavior.
- Updated workflow instructions so the visual companion is not offered by default.

## Verification

- `flutter test test/widget_test.dart` — 51/51 passed
- `flutter analyze` — No issues found

## Known Issues / Pre-existing Failures

- None

## Manual QA

- Navigate Home -> TV and verify the TV tab is active.
- Navigate TV -> Filmes and TV -> Séries.
- Navigate Movies/Series/detail screens -> TV.
- Verify TV screen sections: search, featured cards, chips, and channel list.

## Documentation

- PRD: `docs/prds/IXSTREAM-17-criar-tela-tv-ao-vivo-flutter.md`
- Workflow: `.agents/workflow/current.md`
```

## Finalization Plan

- Branch: `main`
- Upstream: `origin/main`
- Push Target: `origin/main`
- Files To Commit: IXSTREAM-17 implementation, tests, PRD, workflow archive/reset, and `AGENTS.md` visual companion default instruction
- Commit Message: `feat(ui): add live TV screen with bottom nav integration [IXSTREAM-17]`
- Documentation Final Sync: PRD status is `Implemented`, acceptance criteria checked, open questions `None`; ADR and Design Doc not required
- Jira Final Comment: will add implementation/test/lint summary after commit/push approval; Jira comments may fail if visibility settings reject available roles
- Workflow Archive: `.agents/workflow/archive/IXSTREAM-17-criar-tela-tv-ao-vivo-flutter.md`

## Finalization Results

- Commit:
- Push:
- Jira Update:
- Workflow Archive:
