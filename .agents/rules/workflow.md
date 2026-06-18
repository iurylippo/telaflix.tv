# Workflow Rules

Every non-trivial task must follow the multi-agent workflow:

1. brainstormer
2. planner
3. plan-reviewer
4. implementor
5. reviewer
6. tester
7. linter
8. commit-message

The active workflow state lives at:

`.agents/workflow/current.md`

Finished workflows must be archived at:

`.agents/workflow/archive/{JIRA_ID}-{slug}.md`

## Agent Naming

- `brainstormer`: debates the problem, scope, Jira intake, PRD, ADR/design decision.
- `planner`: creates the technical implementation plan.
- `plan-reviewer`: challenges the technical plan before implementation.
- `implementor`: implements the approved plan.
- `reviewer`: reviews the implemented code.
- `tester`: runs focused tests.
- `linter`: runs lint/typecheck/format validation.
- `commit-message`: generates commit and PR text.

Do not implement before scope is clear.

Do not skip approval gates for risky work.
