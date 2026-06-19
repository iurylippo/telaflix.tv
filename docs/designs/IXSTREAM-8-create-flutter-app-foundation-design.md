# IXSTREAM-8 - Create Flutter app foundation for Telaflix.TV Design

## Status

Approved

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-8
- PRD: `docs/prds/IXSTREAM-8-create-flutter-app-foundation.md`
- ADRs: `docs/adrs/0001-IXSTREAM-8-flutter-app-architecture.md`
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/`

## Overview

This design prepares the initial Flutter app foundation for `Telaflix.TV`. The implementation should create a Flutter app targeting Android and iOS with app identifier `tv.telaflix.app`, while establishing a maintainable architecture for future product work.

## Current Architecture

No Flutter app scaffold is currently present in the repository documentation scan for this task. The workflow expects future app code to live under `src/`.

## Proposed Architecture

Use a feature-first Clean Architecture approach:

```text
src/<app-folder>/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   └── src/
│       ├── app/
│       │   ├── app.dart
│       │   └── theme/
│       ├── core/
│       │   ├── config/
│       │   ├── errors/
│       │   └── utils/
│       └── features/
│           └── home/
│               └── presentation/
└── test/
```

The planner should validate the exact generated Flutter structure and avoid creating empty domain/data/application folders until a feature needs them.

Recommended approach:

- `app/`: app widget, router configuration, global theme, and top-level providers if dependency approval is granted.
- `core/`: reusable non-feature utilities and configuration boundaries.
- `features/`: product feature modules organized by feature name.
- Tests should mirror app/feature boundaries.

## Data Model Changes

None for the initial scaffold.

## API Changes

None for the initial scaffold.

## UI/App Changes

- Create a Flutter app named `Telaflix.TV`.
- Configure Android/iOS app identifier as `tv.telaflix.app`.
- Include only a minimal starter home screen needed to verify scaffold health.
- Establish centralized theme and routing locations, even if minimal initially.

## Caching Strategy

No caching is required for the initial scaffold.

## Security Considerations

- Do not commit `.env` files, signing keys, keystores, provisioning profiles, certificates, tokens, or private service URLs.
- If environment configuration is scaffolded, include only safe example values and documentation in code comments where appropriate.
- Any future authentication, authorization, storage access, or playback token handling requires separate Jira scope and likely additional ADR/design documentation.

## Migration Plan

No data migration is required. The implementation is a new app scaffold.

## Rollback Plan

If the scaffold is unsuitable, revert the generated app directory and documentation changes for this Jira task before adding product features.

## Test Plan

Planner should define exact commands after inspecting the generated project, likely including:

- `flutter test`
- `flutter analyze`
- platform/package identifier verification by inspecting generated Android/iOS config files

Commands must be run from the Flutter app directory, not from the repository root.

## Open Questions

- Confirm app folder path under `src/`, for example `src/telaflix_app/`.
- Confirm whether to add initial architecture dependencies during scaffold or defer until the first product feature.
