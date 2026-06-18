---
name: git-commit
description: Generate high-quality Conventional Commit messages, PR titles, and PR descriptions from Jira ID, workflow state, and git diff. Keeps Jira issue IDs in the commit message.
---

---

# Git Commit Skill

Use this skill when generating:

- commit messages
- PR titles
- PR descriptions
- release-oriented summaries
- final workflow commit drafts

This skill must generate text only.

Do not run `git commit`.
Do not run `git push`.
Do not create branches.
Do not open Pull Requests.
Do not mutate source code.

## Required Inputs

Before generating commit or PR text, inspect:

- `.agents/workflow/current.md`
- linked Jira issue when available
- PRD when available
- ADRs when available
- Design Doc when available
- `git status`
- `git diff`

Use the Jira ID from workflow metadata as the canonical issue ID.

Example:

```text
PROJ-123
```

## Commit Message Standard

Use Conventional Commits.

Preferred format:

```text
type(scope): concise imperative summary [JIRA-ID]
```

Example:

```text
feat(player): add manual quality selection [PROJ-123]
```

## Allowed Types

Choose exactly one:

- `feat` — new user-facing or product behavior
- `fix` — bug fix
- `refactor` — code restructuring without behavior change
- `test` — tests only
- `docs` — documentation only
- `chore` — maintenance, tooling, config, non-product changes
- `style` — formatting only, no behavior change
- `perf` — performance improvement
- `build` — build system or dependency changes
- `ci` — CI/CD changes
- `revert` — revert a previous commit

## Scope Rules

Use a short, stable scope that matches the affected module or component.

Good scopes examples:

- `ui`
- `api`
- `auth`
- `tests`
- `workflow`
- `docs`
- project-specific component/module scopes

Prefer domain scope over file scope.

Good:

```text
feat(player): add manual quality selection [PROJ-123]
```

Avoid:

```text
feat(player-modal-component): add quality button [PROJ-123]
```

## Summary Rules

The summary must:

- be imperative
- be concise
- be in English
- not end with a period
- avoid vague words like `update`, `change`, `adjust`, `misc`
- describe the user-visible or technical outcome
- stay preferably under 72 characters when possible
- always include the Jira ID at the end using `[JIRA-ID]`

Good:

```text
feat(player): add manual quality selection [PROJ-123]
```

Bad:

```text
PROJ-123: Add manual quality selection
```

Bad:

```text
feat: update player stuff
```

## Jira ID Rule

Always keep the Jira ID in the commit message.

Preferred:

```text
feat(scope): summary [PROJ-123]
```

Allowed only if the repository explicitly requires Jira ID first:

```text
PROJ-123 feat(scope): summary
```

Default to the preferred format unless the user says otherwise.

## Body Rules

For normal feature commits, generate a one-line commit message only.

Generate a commit body only when:

- there are multiple unrelated but intentional areas
- there are migrations or breaking changes
- there are important test caveats
- the user asks for a detailed commit
- the change is risky or architectural

Body format when needed:

```text
feat(scope): summary [JIRA-ID]

- Explain the main change
- Mention important test or migration notes
- Mention known pre-existing failures if relevant
```

## Breaking Change Rule

If the change is breaking, include:

```text
BREAKING CHANGE: explanation
```

Do not mark a breaking change unless the diff proves it.

## PR Title Standard

Use this format:

```text
[JIRA-ID] Short human-readable title
```

Example:

```text
[PROJ-123] Add manual quality selection to player
```

PR title can be in Portuguese when the Jira/PRD title is in Portuguese.

## PR Description Standard

Generate PR descriptions in Markdown.

Use this structure:

```markdown
## Summary

-

## Changes

-

## Verification

-

## Known Issues / Pre-existing Failures

-

## Manual QA

-

## Documentation

-
```

## Verification Rules

Separate successful checks from pre-existing failures.

Good:

```markdown
## Verification

- `pytest tests/unit` — passed
- `npm run lint` — passed
- `npm run format` — passed

## Known Issues / Pre-existing Failures

- Full test suite has unrelated pre-existing failures.
- Type check has unrelated pre-existing errors.
```

Do not hide failures.

Do not claim failures are pre-existing unless the workflow state, test history, or user explicitly confirms it.

## Workflow Update

Update `.agents/workflow/current.md` sections:

```md
## Commit Message Draft
```

```md
## Pull Request Title Draft
```

and:

```md
## Pull Request Description Draft
```

Also update:

```md
## Agent Progress
```

Set:

```md
- [x] commit-message
```

Do not archive the workflow unless explicitly requested.

## Output Format

Return:

```text
Commit Message:
<message>

PR Title:
<title>

PR Description:
<markdown>

Notes:
-
```

## Safety Rules

- Do not run `git commit`.
- Do not run `git push`.
- Do not create a branch.
- Do not open a PR.
- Do not modify files except `.agents/workflow/current.md`.
- Do not include secrets, tokens, `.env` values, or credentials.
- Do not invent test results.
- Do not invent Jira links.
- Do not invent PR links.
