# Workflow State

## Workflow Routing

- Classification: full-workflow
- Reason:
  - Why not quick-fix: creating a new Flutter application and selecting an architecture/state-management approach is not a trivial local edit.
  - Why not standard-task: project scaffolding plus architecture decisions affect long-term repository structure, dependencies, navigation, state management, testing, and future feature development.
  - Why full-workflow: this is foundational architecture work for a new application and needs Jira/PRD/workflow alignment before implementation.
- Selected Workflow: @brainstormer → planner → @plan-reviewer → @implementor → @reviewer → @tester → @linter → @commit-message
- Next Agent: @implementor

## Metadata

- Jira ID: IXSTREAM-8
- Jira URL: https://iurylippo.atlassian.net/browse/IXSTREAM-8
- Title: Create Flutter app foundation for Telaflix.TV
- Slug: create-flutter-app-foundation
- Status: technical plan approved; pending implementation start gates
- Owner:
- Created At: 2026-06-18
- Updated At: 2026-06-18

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-8
- PRD: `docs/prds/IXSTREAM-8-create-flutter-app-foundation.md`
- Design Doc: `docs/designs/IXSTREAM-8-create-flutter-app-foundation-design.md`
- ADRs: `docs/adrs/0001-IXSTREAM-8-flutter-app-architecture.md`
- Branch:
- Pull Request:

## Affected Projects

- `src/`

## Request

- Create a new Flutter application named `Telaflix.TV`, scaffold the initial project structure, and recommend a maintainable Flutter architecture.
- Initial target platforms: Android and iOS.
- User requested installing external OpenCode skills:
  - `npx skills add flutter/skills --skill '*' --agent universal`
  - `npx skills add dart-lang/skills --skill '*' --agent universal`

## Jira Summary

- Created Jira issue `IXSTREAM-8` in project `IXSTREAM` for the Telaflix.TV Flutter app foundation. Status: `A fazer`; assignee: unassigned; priority: Medium.
- Jira comment attempts failed due to visibility restrictions in the current tool session; generated documentation paths were added to the Jira description instead.

## Clarified Scope

- App name: `Telaflix.TV`.
- Initial platforms: Android and iOS.
- Package/bundle identifier: `tv.telaflix.app`.
- External Flutter/Dart OpenCode skills installed by user and OpenCode restarted.

## Open Questions

- Documentation status: PRD and Design Doc are still `Draft`, ADR is still `Proposed`; update to implementation-ready/accepted before handoff to @implementor.

## Constraints

- Do not scaffold or implement code until Jira/PRD/workflow state are aligned and the architecture is approved.
- Do not add dependencies without explicit approval.
- Keep the architecture generic enough for a clean Flutter application while allowing future product growth.
- Flutter/Dart external skills are available after user installation and OpenCode restart.
- Jira comment visibility is restricted in the current MCP/tool configuration; use Jira description edits for documentation path sync if comments continue to fail.

## Acceptance Criteria

- Jira issue `IXSTREAM-8` is linked to workflow and documentation.
- PRD, ADR, and Design Doc are created before implementation.
- Architecture recommendation is documented before scaffold implementation.
- Implementation plan covers Android and iOS scaffold for app `Telaflix.TV` with package/bundle identifier `tv.telaflix.app`.
- No code is scaffolded before PRD/design approval and planning review.

## Documentation Decision

- PRD Required: yes — created at `docs/prds/IXSTREAM-8-create-flutter-app-foundation.md`
- ADR Required: yes — created as proposed ADR at `docs/adrs/0001-IXSTREAM-8-flutter-app-architecture.md`
- Design Doc Required: yes — created at `docs/designs/IXSTREAM-8-create-flutter-app-foundation-design.md`

## Plan

- Workflow routing remains `full-workflow` because this establishes the long-term Flutter architecture and app scaffold.
- Use app directory `src/telaflix_app/` unless the user overrides it before implementation.
- Scaffold a Flutter application targeting Android and iOS only, using app display name `Telaflix.TV` and package/bundle identifier `tv.telaflix.app`.
- Use this scaffold command from the repository root's existing parent context, but execute it from the repository root only because it creates the new `src/telaflix_app/` project directory:
  ```bash
  flutter create --platforms=android,ios --org tv.telaflix --project-name telaflix_app src/telaflix_app
  ```
- Important scaffold naming rule:
  - Dart/Flutter project name: `telaflix_app`.
  - User-facing app display name: `Telaflix.TV`.
  - Required Android application ID and iOS bundle identifier: `tv.telaflix.app`.
  - The scaffold command may initially generate Android/iOS identifiers from `--org` + project name, such as `tv.telaflix.telaflix_app`; implementation must explicitly inspect and correct generated platform metadata to `tv.telaflix.app`.
- After scaffold, run all follow-up commands from `src/telaflix_app/`, not repository root.
- Adopt feature-first Clean Architecture with minimal initial ceremony:
  - `lib/main.dart` as the app bootstrap.
  - `lib/src/app/` for app widget, theme, and top-level app composition.
  - `lib/src/core/` for cross-cutting config/errors/utils only when concrete code exists.
  - `lib/src/features/home/presentation/` for the minimal starter home screen.
  - Do not create empty `domain/`, `data/`, or `application/` folders until a feature has concrete logic requiring them.
- Dependency strategy:
  - Defer `flutter_riverpod` and `go_router` for IXSTREAM-8 to keep the initial scaffold dependency-free beyond Flutter SDK defaults.
  - Use plain `MaterialApp` plus a minimal home screen for the initial app shell.
  - Keep ADR recommendation as future direction, but do not add architecture dependencies until the first feature requiring state management/routing or until the user explicitly approves them.
  - Defer model/codegen dependencies such as `freezed`, `json_serializable`, `build_runner`, HTTP clients, local database/cache, localization packages, analytics, auth, and playback packages until feature scope requires them.
- Initial app shell:
  - Root app widget configured with `MaterialApp`, title `Telaflix.TV`, theme, and `HomeScreen`.
  - Minimal home screen that renders the app name and confirms the scaffold runs.
  - No product screens, auth, streaming, catalog, persistence, billing, analytics, or API integration.
- Correct app-root structure:
  ```text
  src/telaflix_app/
  ├── android/
  ├── ios/
  ├── lib/
  │   ├── main.dart
  │   └── src/
  │       ├── app/
  │       │   ├── app.dart
  │       │   └── theme/
  │       │       └── app_theme.dart
  │       └── features/
  │           └── home/
  │               └── presentation/
  │                   └── home_screen.dart
  ├── test/
  ├── pubspec.yaml
  └── analysis_options.yaml
  ```
- Keep generated platform folders limited to Android/iOS. Do not add Web/Desktop unless separately requested.
- Add/update widget tests for the starter app shell after scaffold exists.
- Before implementation starts:
  - @plan-reviewer must re-review this revised plan.
  - PRD/Design Doc statuses must be moved out of `Draft` and ADR status must be accepted if the architecture is approved.
  - Jira implementation gate still requires active sprint and assignee validation by @implementor.

## Debate Notes

- Planner note: the installed `flutter-apply-architecture-best-practices` skill suggests MVVM with ChangeNotifier/Listenable and a hybrid `data/domain/ui` layout. For this repository, the existing ADR/design direction of feature-first Clean Architecture is still preferable because it keeps future feature code co-located. The plan can still apply the skill's separation-of-concerns guidance inside each feature.
- Plan-reviewer challenge: approve the feature-first Clean Architecture direction, but keep the first scaffold simpler than the dependency recommendation if no concrete route/state use exists. `flutter_riverpod` and `go_router` should be either explicitly approved by the user or deferred until the first feature needing them; a plain `MaterialApp` + home screen is the simpler acceptable baseline for IXSTREAM-8.
- Plan-reviewer challenge: clarify the exact Flutter scaffold command/options before implementation. The user-facing app name `Telaflix.TV` is not the Dart package/project name; use a valid project directory/name such as `telaflix_app`, then separately set Android/iOS display names and verify `tv.telaflix.app` is not accidentally generated as `tv.telaflix.telaflix_app`.
- Plan-reviewer finding: the Design Doc architecture tree currently appears to place `test/`, `android/`, and `ios/` under `lib/` due to indentation. Before implementation, revise the docs/plan or explicitly state that `test/`, `android/`, and `ios/` are app-root siblings of `lib/`.
- Plan-reviewer finding: test strategy needs more concrete verification for platform metadata: Android application ID/namespace, Android app label, iOS `PRODUCT_BUNDLE_IDENTIFIER`, and iOS display name should be inspected after scaffold. Add a widget test asserting the starter shell renders `Telaflix.TV`; if `go_router` is approved, include an initial route/router smoke test.
- Plan-reviewer risk: do not introduce signing config, keystores, provisioning profiles, `.env` files, API endpoints, or credentials during scaffold. Generated platform code should be kept intact except for required identifier/display-name metadata.
- Planner revision: dependencies `flutter_riverpod` and `go_router` are deferred for IXSTREAM-8. The initial scaffold should use plain `MaterialApp` and no new dependencies beyond Flutter defaults.
- Planner revision: exact scaffold command is `flutter create --platforms=android,ios --org tv.telaflix --project-name telaflix_app src/telaflix_app`, followed by explicit metadata correction/verification for `tv.telaflix.app`.
- Planner revision: corrected project tree states `android/`, `ios/`, and `test/` are app-root siblings of `lib/`, not children of `lib/`.
- Plan-reviewer re-review result: approved the revised technical plan. The previous findings are sufficiently addressed: scaffold command/name separation is explicit, dependency additions are deferred, the workflow tree is corrected, metadata verification is part of the test strategy, widget/static-analysis checks are defined, and security boundaries avoid signing, credentials, `.env`, endpoints, and unrelated platform changes.
- Plan-reviewer re-review note: documentation remains an implementation start gate, not a technical plan blocker. Before scaffolding, update PRD/Design Doc/ADR statuses and sync the Design Doc tree/open questions with the approved workflow plan so downstream agents do not follow stale draft content.

## Files To Change

- `src/telaflix_app/pubspec.yaml` — project metadata and approved dependencies.
- `src/telaflix_app/analysis_options.yaml` — Flutter/Dart lint configuration if generated or required.
- `src/telaflix_app/lib/main.dart` — bootstrap entrypoint.
- `src/telaflix_app/lib/src/app/app.dart` — root app widget.
- `src/telaflix_app/lib/src/app/theme/app_theme.dart` — app theme definitions.
- `src/telaflix_app/lib/src/features/home/presentation/home_screen.dart` — minimal starter screen.
- `src/telaflix_app/test/widget_test.dart` or `src/telaflix_app/test/app/app_test.dart` — widget test asserting `Telaflix.TV` renders.
- `src/telaflix_app/android/` — generated Android project, including package/application ID metadata.
- `src/telaflix_app/ios/` — generated iOS project, including bundle identifier/display name metadata.

## Test Strategy

- Run focused Flutter tests from `src/telaflix_app/` after implementation:
  - `flutter test`
  - Expected coverage: starter widget test asserts the app shell renders `Telaflix.TV`.
- Run static analysis from `src/telaflix_app/` after implementation:
  - `flutter analyze`
- Verify generated Android metadata by inspecting generated config files after scaffold:
  - Android application ID is `tv.telaflix.app`.
  - Android namespace is `tv.telaflix.app` when present in generated Gradle config.
  - Android app label/display name is `Telaflix.TV`.
- Verify generated iOS metadata by inspecting generated config files after scaffold:
  - iOS `PRODUCT_BUNDLE_IDENTIFIER` is `tv.telaflix.app`.
  - iOS display name is `Telaflix.TV`.
- Because `go_router` is deferred, no router smoke test is required for IXSTREAM-8.
- Optionally run the app on Android/iOS simulators only if available; do not claim runtime validation unless actually executed.

## Implementation Start Gate

- Jira Issue: IXSTREAM-8
- In Active Sprint: yes — SCRUM Sprint 0 (active, 2026-06-10 to 2026-06-24)
- Assignee: Iury Vieira Lippo da Silva
- Status: Em andamento (transitioned from A fazer)
- Documentation Status: PRD Approved, Design Doc Approved, ADR Accepted
- Decision: implementation allowed — all Jira gates pass

## Implementation Notes

- Jira gates (sprint, assignee, status) all pass. Issue transitioned to `Em andamento`.
- PRD status: Draft → Approved
- ADR status: Proposed → Accepted
- Design Doc status: Draft → Approved; tree fixed (`test/`, `android/`, `ios/` now siblings of `lib/`).
- Blocked: Flutter SDK is not installed on this machine. Neither `flutter` nor `dart` commands are available in PATH or common installation paths. The `fvm` version manager is also not installed.
- Required User Action: Install the Flutter SDK (or FVM) and ensure `flutter create` is available, then ask me to continue scaffolding. Alternatively, scaffold the files manually and skip the `flutter create` step.

## Review Findings

- Plan review result: changes required before implementation. Architecture direction is acceptable, but the plan needs the scaffold command/name clarification, dependency approval/defer decision, design tree correction, and concrete metadata/test checks listed in Debate Notes.
- Planner revision result: addressed plan-reviewer findings in workflow plan by specifying scaffold command, deferring Riverpod/go_router, correcting app-root tree, strengthening tests/metadata checks, and preserving security boundaries. Docs still need status/content sync before implementation handoff.
- Plan re-review result: approved. No remaining technical plan blockers for IXSTREAM-8. Implementation remains gated on document status/content sync and Jira sprint/assignee/status validation as recorded in Implementation Start Gate.

## Test Results

-

## Security Findings

- Plan security review approved for scaffold scope: no `.env`, credentials, signing config, keystores, provisioning profiles, API endpoints, auth, storage, billing, analytics, or playback secrets should be introduced. Platform edits should be limited to required identifier/display-name metadata.

## Lint Results

-

## Final Checklist

- [x] Jira task linked
- [x] Jira issue read through MCP
- [x] PRD created or updated
- [x] Jira updated with PRD path
- [x] ADR created if needed
- [x] Jira updated with ADR path if ADR exists
- [x] Design Doc created if needed
- [x] Jira updated with Design Doc path if Design Doc exists
- [ ] Scope approved
- [x] Plan approved
- [ ] Implementation completed
- [ ] Review completed
- [ ] Tests run or explicitly skipped with reason
- [ ] Lint/typecheck run or explicitly skipped with reason
- [ ] Jira commented with implementation/test summary
- [ ] Workflow archived

## Commit Message Draft

-

## Pull Request Description Draft

-
