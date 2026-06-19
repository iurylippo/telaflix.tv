## Repository-Level Agent Structure

This repository uses a root-level agent workflow.

Allowed root-level agent/documentation directories:

```text
docs/
.agents/
.opencode/
```

Do not create random files in the repository root.

Recommended structure:

```text
.
├── AGENTS.md
├── opencode.json
│
├── .opencode/
│   └── agents/
│       ├── brainstormer.md
│       ├── planner.md
│       ├── plan-reviewer.md
│       ├── implementor.md
│       ├── reviewer.md
│       ├── tester.md
│       ├── linter.md
│       └── commit-message.md
│
├── .agents/
│   ├── rules/
│   ├── skills/
│   └── workflow/
│       ├── current.md
│       └── archive/
│
├── docs/
│   ├── prds/
│   ├── adrs/
│   └── designs/
│
└── src/
```

## Agent Skills

Skills live in:

```text
.agents/skills/
```

They are registered via:

```text
opencode.json → skills.paths
```

The `using-superpowers` skill auto-triggers on session start.

Use skills for repeatable procedures.

Available/recommended skills:

```text
.agents/skills/jira-automation.md
.agents/skills/task-debate.md
.agents/skills/create-prd.md
.agents/skills/create-adr.md
.agents/skills/create-design-doc.md
.agents/skills/create-workflow-state.md
.agents/skills/review-implementation.md
.agents/skills/generate-pr-description.md
```

## Jira MCP

Jira MCP is connected and must be used for task operations.

Use `.agents/skills/jira-automation.md` whenever the agent needs to:

- find an existing Jira issue
- create a new Jira issue
- update Jira description
- add Jira comments
- move Jira status
- link PRD/ADR/Design/workflow paths to Jira
- read issue title, description, acceptance criteria, labels, sprint, priority, or status

Jira is the canonical task tracker for this repository.

For every user-requested feature, bug, refactor, or technical task handled by the planner, Jira comes first even when the change is small.

Only skip Jira/PRD/workflow setup when the user explicitly asks for a quick local-only change or when the change is purely mechanical, such as a typo, formatting-only edit, obvious one-line import/lint fix, or documentation copy correction.

Minimum workflow for small but real product/code tasks:

1. Check whether the user provided a Jira ID.
2. If a Jira ID was provided, read the issue through Jira MCP before planning.
3. If no Jira ID was provided, search Jira for an existing matching issue.
4. If no matching issue exists, create a new Jira issue through Jira MCP using `.agents/skills/jira-automation.md`.
5. Create or update a PRD for the requested behavior, even if the PRD is short.
6. Decide and record that ADR is not required when there is no long-term technical decision.
7. Decide and record that Design Doc is not required when the task is small, isolated, and low-risk.
8. Initialize or update `.agents/workflow/current.md` before planning implementation.
9. Create a technical plan before implementation.
10. Run review/test/lint steps as appropriate for the risk and affected code; plan-reviewer is optional for small, clear tasks.

Full workflow for non-trivial, risky, ambiguous, or cross-module work:

1. Check whether the user provided a Jira ID.
2. If a Jira ID was provided, read the issue through Jira MCP before planning.
3. If no Jira ID was provided, search Jira for an existing matching issue.
4. If no matching issue exists, create a new Jira issue through Jira MCP using `.agents/skills/jira-automation.md`.
5. Use the Jira ID as the canonical identifier for docs, workflow archive, branch, commits, and PR.
6. After creating or updating local docs, update the Jira issue with links/paths to the generated files.
7. Do not implement before the Jira issue and workflow state are aligned, unless the user explicitly asks for a quick local-only change.

If Jira MCP fails, record the failure in `.agents/workflow/current.md` and ask the user how to proceed.

## Agent Rules

Rules live in:

```text
.agents/rules/
```

Rules define mandatory behavior.

Skills define how to perform a specific task.

Recommended rules:

```text
.agents/rules/workflow.md
.agents/rules/jira.md
.agents/rules/prd.md
.agents/rules/adr.md
.agents/rules/design-doc.md
.agents/rules/coding-standards.md
.agents/rules/testing.md
.agents/rules/security.md
```

## Multi-Agent Workflow

This repository uses a structured workflow inspired by the OpenCode multi-agent setup.

Default agent order:

```text
brainstormer
planner
plan-reviewer
implementor
reviewer
tester
linter
commit-message
```

### Agent Responsibilities

#### `brainstormer`

Responsible for turning a raw idea into a development-ready task.

It must:

- understand the request
- clarify scope
- use `.agents/skills/jira-automation.md`
- check if a Jira ID exists
- read the Jira issue if an ID exists
- search Jira for a matching issue if no ID was provided
- create a Jira issue via MCP when no matching issue exists
- create or update the PRD
- decide if ADR is needed
- decide if Design Doc is needed
- initialize `.agents/workflow/current.md`
- update Jira with generated doc/workflow paths
- never implement code

#### `planner`

Responsible for the technical implementation plan.

It must:

- read `.agents/workflow/current.md`
- read the linked Jira issue through MCP
- read the PRD
- read related ADRs
- read the Design Doc when present
- inspect the relevant code
- identify files likely to change
- define test strategy
- update `.agents/workflow/current.md`
- never implement code

#### `plan-reviewer`

Responsible for challenging the technical plan before implementation.

It must:

- look for simpler alternatives
- detect missing requirements
- detect missing tests
- detect risks
- detect missing ADR/design-doc needs
- update debate notes
- never implement code

#### `implementor`

Responsible for implementation.

It must:

- follow the approved plan
- respect Jira scope, PRD, ADRs and Design Doc
- make small focused changes
- avoid unrelated changes
- update implementation notes

#### `reviewer`

Responsible for code and scope review.

It must:

- compare implementation against Jira issue
- compare implementation against PRD
- compare implementation against plan
- check edge cases
- check maintainability
- check security concerns
- update review findings

#### `tester`

Responsible for tests.

It must:

- run focused tests first
- record exact commands
- record results honestly
- never claim tests passed unless they were actually run

#### `linter`

Responsible for lint/typecheck/format validation.

It must:

- run relevant lint/typecheck commands
- record exact commands
- record results honestly
- avoid changing code unless explicitly requested

#### `commit-message`

Responsible for commit/PR text and final workflow finalization when explicitly requested.

It must:

- inspect the diff
- read `.agents/workflow/current.md`
- read the linked Jira issue
- generate commit message
- generate PR description
- include Jira ID
- include docs links
- include tests/lint status
- when finalization is requested, show branch/upstream/push target/files/commit message and ask for explicit approval before archiving workflow, resetting workflow, staging, committing, pushing, or Jira final comment
- after explicit approval, archive workflow and reset `.agents/workflow/current.md` first, stage intended files including the workflow archive/reset, commit, push to the approved target, and add/update Jira with the final summary

## Jira-First Workflow

For every planner-handled feature, bug, refactor, or technical task, Jira comes first.

Small tasks still require the minimum workflow unless the user explicitly requests a quick local-only change. A small feature can skip ADR, Design Doc, and plan-reviewer when those are not justified, but it must not skip Jira, PRD, workflow state, technical plan, implementation notes, tests/lint results, and final Jira/workflow updates.

Task lifecycle:

```text
raw request
↓
brainstormer
↓
Jira MCP search/create/read
↓
PRD
↓
ADR decision
↓
Design Doc decision
↓
workflow state
↓
planner
↓
plan-reviewer
↓
implementation
↓
review
↓
tests
↓
lint
↓
commit/PR draft
↓
finalization approval
↓
commit and push
↓
Jira update/comment
↓
workflow archive
```

Use Jira ID in:

```text
branch: feature/{JIRA_ID}-{slug}
commit: {JIRA_ID}: {short description}
PR title: {JIRA_ID} - {title}
```

## Documentation Locations

This repository uses a single root-level `docs/` directory for official product and architecture documentation.

Do not create documentation inside each sub-project unless explicitly requested.

Documentation paths:

```text
docs/prds/{JIRA_ID}-{slug}.md
docs/adrs/{ADR_NUMBER}-{JIRA_ID optional}-{decision-slug}.md
docs/designs/{JIRA_ID}-{slug}-design.md
```

Workflow state paths:

```text
.agents/workflow/current.md
.agents/workflow/archive/{JIRA_ID}-{slug}.md
```

Every PRD, ADR, Design Doc and workflow archive must include affected projects when applicable:

```md
## Affected Projects

- `src/`
```

## PRD Rules

Create a PRD for every user-requested product feature handled by the planner, including small UI features.

For small, clear features, the PRD may be concise but must still capture problem, goal, scope, acceptance criteria, risks, and open questions.

A PRD describes what must be delivered and why.

PRD path:

```text
docs/prds/{JIRA_ID}-{slug}.md
```

A PRD must include:

```md
# {JIRA_ID} - {Title}

## Status

Draft | Approved | In Progress | Implemented | Cancelled

## Links

- Jira:
- ADRs:
- Design Doc:
- Workflow:

## Affected Projects

- `src/`

## Problem

## Goal

## Scope

## Out of Scope

## Functional Requirements

## Non-Functional Requirements

## Acceptance Criteria

## Risks

## Open Questions
```

After creating or updating a PRD, update the Jira issue with the PRD path.

Do not implement a new feature before the PRD is approved, unless the user explicitly asks for a quick implementation without PRD.

## ADR Rules

Create an ADR only when there is a technical decision with long-term impact.

Examples:

- choosing a framework or library
- choosing a state management approach
- choosing a data persistence strategy
- choosing an API architecture
- changing authentication
- changing authorization
- changing CI/CD strategy
- changing storage/cache strategy

ADR path:

```text
docs/adrs/{ADR_NUMBER}-{JIRA_ID optional}-{decision-slug}.md
```

ADR numbering is sequential for the whole repository.

ADR template:

```md
# ADR {ADR_NUMBER}: {Decision Title}

## Status

Proposed | Accepted | Deprecated | Superseded

## Date

YYYY-MM-DD

## Related Task

- Jira:

## Related Documents

- PRD:
- Design Doc:
- Workflow:

## Affected Projects

- `src/`

## Context

## Decision

## Alternatives Considered

## Consequences

## Implementation Notes
```

After creating or updating an ADR, update the Jira issue with the ADR path.

Do not create ADRs for trivial implementation details.

## Design Doc Rules

Create a Design Doc only when the task is large, ambiguous, risky, or spans multiple modules.

Use Design Docs for:

- database or data model changes
- authentication/authorization changes
- API contract changes
- performance-sensitive features
- multi-step migrations
- cross-module coordination
- infrastructure or deployment changes

Design Doc path:

```text
docs/designs/{JIRA_ID}-{slug}-design.md
```

Design Doc template:

```md
# {JIRA_ID} - {Title} Design

## Status

Draft | Approved | Implemented | Cancelled

## Links

- Jira:
- PRD:
- ADRs:
- Workflow:

## Affected Projects

- `src/`

## Overview

## Current Architecture

## Proposed Architecture

## Data Model Changes

## API Changes

## UI/App Changes

## Caching Strategy

## Security Considerations

## Migration Plan

## Rollback Plan

## Test Plan

## Open Questions
```

After creating or updating a Design Doc, update the Jira issue with the Design Doc path.

Do not create a Design Doc for small UI changes, simple endpoints or isolated bug fixes.

## Workflow State Rules

The active workflow file is:

```text
.agents/workflow/current.md
```

It must be updated during the task lifecycle.

Workflow state template:

```md
# Workflow State

## Metadata

- Jira ID:
- Jira URL:
- Title:
- Slug:
- Status:
- Owner:
- Created At:
- Updated At:

## Links

- Jira:
- PRD:
- Design Doc:
- ADRs:
- Branch:
- Pull Request:

## Affected Projects

- `src/`

## Request

-

## Jira Summary

-

## Clarified Scope

-

## Open Questions

-

## Constraints

-

## Acceptance Criteria

-

## Documentation Decision

- PRD Required:
- ADR Required:
- Design Doc Required:

## Plan

-

## Debate Notes

-

## Files To Change

-

## Implementation Notes

-

## Review Findings

-

## Test Results

-

## Security Findings

-

## Lint Results

-

## Final Checklist

- [ ] Jira task linked
- [ ] Jira issue read through MCP
- [ ] PRD created or updated
- [ ] Jira updated with PRD path
- [ ] ADR created if needed
- [ ] Jira updated with ADR path if ADR exists
- [ ] Design Doc created if needed
- [ ] Jira updated with Design Doc path if Design Doc exists
- [ ] Scope approved
- [ ] Plan approved
- [ ] Implementation completed
- [ ] Review completed
- [ ] Tests run or explicitly skipped with reason
- [ ] Lint/typecheck run or explicitly skipped with reason
- [ ] PRD acceptance criteria checked/resolved before finalization
- [ ] PRD and Design Doc open questions resolved before finalization
- [ ] Jira commented with implementation/test summary
- [ ] Commit created after explicit approval
- [ ] Push completed after explicit approval
- [ ] Workflow archived

## Commit Message Draft

-

## Pull Request Description Draft

-

## Finalization Plan

- Branch:
- Upstream:
- Push Target:
- Files To Commit:
- Commit Message:
- Documentation Final Sync:
- Jira Final Comment:
- Workflow Archive:

## Finalization Results

- Commit:
- Push:
- Jira Update:
- Workflow Archive:
```

When a task is complete, archive the workflow to:

```text
.agents/workflow/archive/{JIRA_ID}-{slug}.md
```

Then reset `.agents/workflow/current.md`.

During finalization, archive and reset must happen before the final commit is created so both `.agents/workflow/archive/{JIRA_ID}-{slug}.md` and the reset `.agents/workflow/current.md` are included in the commit. Do not archive/reset after push, because that leaves uncommitted workflow changes in the worktree.

## Jira Update Rules

After completing planning, implementation, testing, or review, update Jira when useful.

Use Jira comments for:

- PRD created
- ADR created
- Design Doc created
- plan approved
- implementation completed
- tests/lint results
- blocked status
- important scope changes

Do not spam Jira with low-value comments.

Prefer one concise comment per major workflow phase.

## Finalization Rules

The `commit-message` agent owns final workflow finalization after tests and lint pass.

Before staging, committing, pushing, or archiving, it must show:

- current branch
- upstream branch, if any
- push remote and target branch
- files to be committed
- exact commit message
- documentation final sync status
- Jira issue and final comment summary
- workflow archive path

Before showing the final approval gate, it must update final documentation so completed work does not leave stale docs:

- PRD status reflects the final task state (`Implemented` or equivalent repository convention)
- PRD acceptance criteria are checked when satisfied
- PRD open questions are resolved or explicitly marked `None`
- Design Doc status reflects the final task state (`Implemented` or equivalent repository convention)
- Design Doc open questions are resolved or explicitly marked `None`
- ADR status is accepted when the decision was used

It must not ask for final commit/push approval while PRD/Design Doc open questions or PRD acceptance criteria are stale for completed work.

It must ask for explicit user approval before archiving workflow state, resetting workflow state, running `git add`, `git commit`, `git push`, or updating Jira final status/comment.

If approved, it may:

- archive `.agents/workflow/current.md` to `.agents/workflow/archive/{JIRA_ID}-{slug}.md`
- reset `.agents/workflow/current.md`
- stage all intended files for the Jira task and related workflow/docs/configuration updates, including the workflow archive and reset current workflow, in one commit
- commit with the approved message
- push to the approved remote/branch
- update Jira with final implementation/test/lint summary

Finalization order after approval is mandatory:

1. Archive `.agents/workflow/current.md` to `.agents/workflow/archive/{JIRA_ID}-{slug}.md`.
2. Reset `.agents/workflow/current.md` to the base workflow template.
3. Stage intended task files, docs, workflow archive, and reset workflow file.
4. Commit with the approved message.
5. Push to the approved remote/branch.
6. Update Jira with the final summary.

Do not commit/push before archive/reset is staged unless the user explicitly requests a non-final partial commit.

Default finalization behavior is one commit per completed Jira task. Do not ask whether to split commits unless the user explicitly requests split commits or unrelated changes are present.

If approval is not provided, it must stop without changing git state or archiving workflow.

## Command Rules

Commands must run from the relevant project directory, never from the repository root.

Exception: repository-level Git/finalization commands (`git status`, `git diff`, `git add`, `git commit`, `git push`, workflow archive/reset) must run from the repository root so paths and repository state are correct.

If a command can modify data, delete files, change dependencies, run migrations, or affect credentials, ask for approval first.

## Approval Gates

Ask for explicit approval before:

- implementing after creating a PRD
- adding dependencies
- changing database migrations
- changing `.env` handling
- touching real credentials
- changing authentication
- changing authorization
- deleting files
- running destructive commands
- creating root-level files outside allowed directories

## Security Rules

- Never commit `.env` files.
- Never print secrets in logs, docs, commits, PR descriptions, Jira comments or workflow files.
- Never expose API keys, database credentials, tokens, signing secrets or private URLs.
- Redact sensitive values when summarizing config.
- Ask before changing anything related to auth, permissions or storage access.

## Coding Standards

- Prefer small, focused changes.
- Follow existing project patterns.
- Do not introduce unnecessary abstractions.
- Do not modify unrelated files.
- Do not add dependencies without approval.
- Do not create verification scripts unless explicitly requested.
- Do not create README files unless explicitly requested.
- Do not claim tests passed unless they were actually run.
- If tests or lint were not run, explain why.

## Don't Do

- Never commit `.env` files.
- Don't create random files in root.
- Official documentation is allowed only under `docs/`.
- Agent workflow/configuration files are allowed only under `.agents/` and `.opencode/`.
- Don't create documentation inside sub-projects unless explicitly requested.
- Don't create READMEs or verification scripts unless explicitly requested.
- Don't add dependencies without approval.
- Don't run commands from root when they belong to a sub-project.
- Don't modify unrelated files.
- Don't implement before scope is clear.
- Don't create ADRs for trivial implementation details.
- Don't create Design Docs for small isolated changes.
- Don't create or update Jira issues without using `.agents/skills/jira-automation.md`.
