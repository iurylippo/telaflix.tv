# ADR 0001: Flutter App Architecture for Telaflix.TV

## Status

Accepted

## Date

2026-06-18

## Related Task

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-8

## Related Documents

- PRD: `docs/prds/IXSTREAM-8-create-flutter-app-foundation.md`
- Design Doc: `docs/designs/IXSTREAM-8-create-flutter-app-foundation-design.md`
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/`

## Context

`Telaflix.TV` is starting as a new Flutter app for Android and iOS. The first implementation should establish a project structure that can grow into streaming/catalog/product features without making early work overly complex.

The long-term decision is how the Flutter app should organize UI, state, routing, domain logic, data access, and tests.

## Decision

Adopt a feature-first Clean Architecture style for the Flutter app:

- Organize code by feature first, with shared app/core modules for cross-cutting concerns.
- Within each feature, separate presentation, application/state, domain, and data responsibilities when the feature needs those layers.
- Keep the initial scaffold minimal; create layer folders when they serve concrete code rather than empty ceremony.
- Prefer dependency boundaries that allow domain/application logic to be tested without Flutter widgets.
- Use centralized app entry, routing, theme, localization-ready structure, and environment configuration boundaries.

Recommended dependency direction for planner evaluation, pending explicit approval before implementation:

- State management / dependency access: Riverpod.
- Routing: `go_router`.
- Immutable models and JSON serialization: evaluate later when APIs/models exist; do not add during initial scaffold unless needed.

## Alternatives Considered

### Minimal Flutter default structure only

Pros: fastest scaffold, fewest dependencies, least ceremony.

Cons: future features can become tangled quickly if routing, state, and data boundaries are added ad hoc.

### Layer-first Clean Architecture

Pros: strong global separation between presentation/domain/data.

Cons: can scatter feature code across top-level layers and slow navigation in larger Flutter apps.

### Feature-first Clean Architecture

Pros: keeps related code together, scales by feature, and still supports clean boundaries where needed.

Cons: requires discipline to avoid over-creating layer folders before they are useful.

## Consequences

- Future implementation should scaffold a feature-oriented `lib/` structure rather than putting all code under generic global layers.
- The first scaffold should avoid premature feature-specific domain/data classes.
- Dependency additions remain approval-gated.
- Tests should be organized around feature and shared module boundaries.

## Implementation Notes

- Recommended app location: under `src/`, with the exact folder decided by the planner/user.
- Keep generated platform code intact except for necessary app identifier/display name configuration.
- No code should be scaffolded by the brainstormer.
