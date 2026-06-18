# Jira Rules

Jira MCP is connected and must be used for task operations.

Use `.agents/skills/jira-automation/SKILL.md` for all Jira actions.

Jira is the canonical task tracker.

For every non-trivial feature, bug, refactor, or technical task:

1. Check if the user provided a Jira ID.
2. If a Jira ID exists, read it through Jira MCP.
3. If no Jira ID exists, search Jira for an existing matching task.
4. If no matching task exists, create a new Jira issue.
5. Use the Jira ID in docs, workflow, branch, commits and PR.
6. Update Jira with PRD/ADR/Design/workflow paths when they are created.

Do not create or update Jira issues outside the Jira automation skill.
