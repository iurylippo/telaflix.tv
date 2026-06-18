---

name: Jira Automation
description: Atlassian/Rovo MCP automation for Jira task intake, issue tracking, PRD/ADR/Design linking, comments, transitions, assignee gates, sprint gates, and workflow synchronization
version: 1.3.0
author: Iury
category: project-management
tags:

* jira
* atlassian
* rovo
* mcp
* issue-tracking
* prd
* adr
* workflow
* opencode
  department: engineering
  models:
* openai/gpt-5.5
* openai/gpt-5.5-fast
* deepseek-v4-pro
* deepseek-v4-flash
  mcp:
  server: atlassian
  tools:

  * atlassian_createJiraIssue
  * atlassian_getJiraIssue
  * atlassian_editJiraIssue
  * atlassian_searchJiraIssuesUsingJql
  * atlassian_transitionJiraIssue
  * atlassian_getTransitionsForJiraIssue
  * atlassian_addCommentToJiraIssue
  * atlassian_addWorklogToJiraIssue
  * atlassian_createIssueLink
  * atlassian_getIssueLinkTypes
  * atlassian_getJiraIssueRemoteIssueLinks
  * atlassian_getVisibleJiraProjects
  * atlassian_getJiraProjectIssueTypesMetadata
  * atlassian_getJiraIssueTypeMetaWithFields
  * atlassian_lookupJiraAccountId
  * atlassian_atlassianUserInfo
    capabilities:
* Search existing Jira issues using JQL
* Read Jira issue context
* Create Jira issues from raw feature requests
* Update Jira issues with PRD, ADR, Design Doc, and workflow paths
* Add concise planning, implementation, testing, lint, and review comments
* Transition issues when explicitly requested or when workflow rules allow it
* Check sprint readiness before implementation
* Check and enforce assignee before implementation
  input:
* Raw feature request
* Existing Jira issue ID
* PRD path
* ADR path
* Design Doc path
* Workflow state path
* Implementation summary
* Test and lint results
  output:
* Jira issue ID
* Jira issue URL
* Jira title
* Jira description
* Jira status
* Jira comments
* Updated workflow metadata
  languages:
* en
* pt-BR
  related_skills:
* task-debate
* create-prd
* create-adr
* create-design-doc
* create-workflow-state
* generate-pr-description

---

# Jira Automation

This skill centralizes all Jira operations for the repository using the official Atlassian/Rovo MCP tools.

Use this skill whenever an agent needs to read, search, create, update, comment on, link, assign, check sprint readiness, or transition a Jira issue.

Jira is the canonical task tracker. Local documentation and workflow files must reference the Jira issue ID.

## Available Jira MCP Tools

Use the Atlassian/Rovo MCP tools exposed in this session.

### Jira Issue Tools

- `atlassian_createJiraIssue`
- `atlassian_getJiraIssue`
- `atlassian_editJiraIssue`
- `atlassian_searchJiraIssuesUsingJql`
- `atlassian_transitionJiraIssue`
- `atlassian_getTransitionsForJiraIssue`
- `atlassian_addCommentToJiraIssue`
- `atlassian_addWorklogToJiraIssue`

### Jira Links and Metadata Tools

- `atlassian_createIssueLink`
- `atlassian_getIssueLinkTypes`
- `atlassian_getJiraIssueRemoteIssueLinks`
- `atlassian_getVisibleJiraProjects`
- `atlassian_getJiraProjectIssueTypesMetadata`
- `atlassian_getJiraIssueTypeMetaWithFields`
- `atlassian_lookupJiraAccountId`
- `atlassian_atlassianUserInfo`

## Primary Goal

Transform user requests into Jira-linked engineering work and keep Jira synchronized with local project artifacts:

- PRD: `docs/prds/{JIRA_ID}-{slug}.md`
- ADR: `docs/adrs/{ADR_NUMBER}-{JIRA_ID optional}-{decision-slug}.md`
- Design Doc: `docs/designs/{JIRA_ID}-{slug}-design.md`
- Workflow State: `.agents/workflow/current.md`
- Workflow Archive: `.agents/workflow/archive/{JIRA_ID}-{slug}.md`

## Default Jira Project

Use `atlassian_getVisibleJiraProjects` to discover available projects.

Use the discovered project key for JQL and issue references.

If the project key is unknown or discovery fails, ask the user which project should be used.

## Project Team

Known assignable developers:

- Iury Vieira Lippo da Silva — `iuryvieira.lippo@gmail.com`

When the issue has no assignee before implementation:

1. Show the known assignable developers list.
2. Ask the user to choose one.
3. Use `atlassian_lookupJiraAccountId` with the selected name/email.
4. Assign using `atlassian_editJiraIssue`.
5. If the desired developer is not listed, ask the user for the name or email.
6. Do not start implementation until the issue has an assignee.

Do not assign automatically unless the user explicitly chooses a developer or says to assign it to them.

## When To Use

Use this skill when:

- The user provides a Jira ID.
- The user asks to plan a feature, bug, refactor, or technical task.
- The agent needs to search for an existing task.
- The agent needs to create a new Jira issue.
- The agent needs to assign a Jira issue.
- The agent needs to check whether a Jira issue is in an active sprint.
- The agent creates or updates PRD, ADR, Design Doc, or workflow state.
- The agent finishes planning, implementation, review, tests, lint, or PR draft.
- The agent needs to add a concise Jira comment.
- The user explicitly asks to move a Jira issue status.

## Do Not Use This Skill For

- Creating sprint dashboards.
- Velocity reports.
- Burndown charts.
- Slack automation.
- GitHub automation.
- Bulk sprint planning.
- Large reporting unless explicitly requested.

This skill is focused on task-level engineering workflow automation.

## Tool Availability Check

Before creating, updating, commenting, assigning, or transitioning a Jira issue:

1. Confirm the current MCP session exposes the required Atlassian tool.
2. Use only the exposed tool names.
3. Do not use legacy tool names such as:
   - `jira_create_issue`
   - `jira_update_issue`
   - `jira_search`
   - `jira_transition`
   - `jira_add_comment`
   - `jira_jql_search`
   - `jira_get_issue`

Use the current Atlassian/Rovo names instead:

- Create issue: `atlassian_createJiraIssue`
- Read issue: `atlassian_getJiraIssue`
- Edit issue: `atlassian_editJiraIssue`
- Search issues: `atlassian_searchJiraIssuesUsingJql`
- Add comment: `atlassian_addCommentToJiraIssue`
- Get transitions: `atlassian_getTransitionsForJiraIssue`
- Transition issue: `atlassian_transitionJiraIssue`
- Lookup user: `atlassian_lookupJiraAccountId`
- Current user: `atlassian_atlassianUserInfo`

If a required tool is not available:

1. Do not claim the action was attempted.
2. Record the missing tool in `.agents/workflow/current.md`.
3. Ask the user to enable the required Atlassian MCP tool or approve a local-only flow.

## Issue Intake Workflow

### Case 1: User Provides Jira ID

If the user provides an issue key such as `PROJ-123`:

1. Read the Jira issue using `atlassian_getJiraIssue`.
2. Extract:
   - issue key
   - title
   - description
   - status
   - priority
   - labels
   - assignee
   - sprint status when needed
   - acceptance criteria if present
   - links if present

3. Update `.agents/workflow/current.md` metadata.
4. Use the Jira issue as the source of truth for the task scope.
5. Do not create a duplicate issue.

### Case 2: User Does Not Provide Jira ID

If the user gives a raw request without a Jira ID:

1. Generate a concise search query from the request.
2. Search Jira for similar open issues using `atlassian_searchJiraIssuesUsingJql`.
3. Use project-scoped JQL with the discovered project key.
4. If a likely match is found, use the matching issue when confidence is high.
5. If no suitable match is found, create a new Jira issue using `atlassian_createJiraIssue`.
6. Use the created issue key as the canonical ID.
7. Update `.agents/workflow/current.md` with the Jira ID and URL.
8. Add a Jira comment linking the workflow state when possible.

### Case 3: Jira MCP Fails

If Jira MCP fails:

1. Record the failure in `.agents/workflow/current.md`.
2. Do not invent a Jira ID.
3. Do not retry with broader invalid JQL.
4. Ask the user whether to retry, provide an existing Jira ID, approve local-only flow, or stop.

## Resolved Jira Failure Cleanup

When a Jira failure is later resolved, update `.agents/workflow/current.md` so the current workflow state reflects the latest truth.

Examples of resolved Jira failures:

- Previous MCP server exposed only read/search tools, but Atlassian/Rovo MCP now exposes write tools.
- Previous project key failed, but the correct project key was found.
- Jira issue creation failed earlier, but a Jira issue was later created.
- Jira comment failed, but the workflow path was added to the issue description.

When resolved:

1. Remove active blocker language from:
   - `Status`
   - `Workflow Routing`
   - `Links`
   - `Open Questions`
   - `Constraints`
   - `Plan`
   - `Debate Notes`

2. Keep only one short historical note in `Jira Summary`.

3. Update metadata with the final Jira issue:

```md
- Jira ID: {issue_key}
- Jira URL: {issue_url}
- Status: {jira_status}
```

4. Update links:

```md
- Jira: {issue_url}
- PRD: `docs/prds/{issue_key}-{slug}.md`
```

5. If Jira comment failed due to visibility settings, do not block the workflow. Record:

```md
- Jira comment could not be added due to comment visibility restrictions. Workflow path is included in the Jira description.
```

6. Continue the workflow if the Jira issue exists.

Do not leave the workflow in `Blocked` after the Jira issue was successfully created.

## JQL Rules

Always prefer project-scoped JQL with the discovered project key.

Good:

```jql
project = {PROJECT_KEY} ORDER BY updated DESC
```

```jql
project = {PROJECT_KEY} AND resolution = Unresolved AND text ~ "{query}" ORDER BY updated DESC
```

```jql
project = {PROJECT_KEY} AND resolution = Unresolved AND summary ~ "{query}" ORDER BY updated DESC
```

```jql
key = {PROJECT_KEY}-123
```

Avoid broad or invalid JQL such as:

```jql
project is not EMPTY
```

```jql
ORDER BY updated DESC
```

```jql
text ~ "{query}" ORDER BY updated DESC
```

If JQL search returns Bad Request:

1. Try `project = {PROJECT_KEY} ORDER BY updated DESC`.
2. If that fails, use `atlassian_getVisibleJiraProjects`.
3. Confirm the project key.
4. Do not block forever.
5. Ask the user for the correct project key or permission to continue local-only.

## Issue Creation Rules

Create a Jira issue only for non-trivial work, such as:

- new feature
- bug fix
- refactor
- architecture change
- infrastructure change
- security-sensitive change

Do not create Jira issues for tiny one-off local edits unless the user asks.

Before creating a new issue:

1. Search existing unresolved issues first.
2. Check for likely duplicates.
3. If no suitable issue exists, create a new one.
4. After creation, update `.agents/workflow/current.md`.
5. Add a comment with the workflow state path when possible.

## Issue Type Selection

Use:

- `Story` for user-facing features.
- `Bug` for broken behavior.
- `Task` / `Tarefa` for technical/internal work.
- `Spike` for research or unclear feasibility.
- `Epic` only when the work clearly contains multiple stories.

When unsure, prefer `Task` / `Tarefa`.

If the issue type is not available in the Jira project:

1. Use `atlassian_getJiraProjectIssueTypesMetadata`.
2. Pick the closest available type.
3. Do not guess silently.

## Jira Summary Format

Use concise summaries.

Examples:

- `Adicionar edição de vídeos no modal de canais`
- `Add manual quality selection to player`
- `Implement local cache for large data lists`
- `Fix token path handling for manifests`
- `Refactor worker output planning`

Do not prefix summaries with `[FEATURE]` unless the Jira project convention requires it.

## Jira Description Template

Use this description when creating a new task:

```md
## Context

{short context from user request}

## Goal

{what should be achieved}

## Scope

- {scope item 1}
- {scope item 2}

## Acceptance Criteria

- [ ] {criterion 1}
- [ ] {criterion 2}
- [ ] {criterion 3}

## Affected Projects

- `src/`

## Technical Notes

{initial technical notes if known}

## Documentation

- PRD: pending
- ADR: pending / not required
- Design Doc: pending / not required
- Workflow: `.agents/workflow/current.md`
```

## Affected Projects Classification

When creating or updating Jira, note the affected project/directory based on the user's request, code context, or PRD.

## Documentation Sync

Whenever local docs are created or updated, add a Jira comment with the paths using `atlassian_addCommentToJiraIssue`.

### PRD Created Comment

```md
PRD created:

- `docs/prds/{JIRA_ID}-{slug}.md`
```

### ADR Created Comment

```md
ADR created:

- `docs/adrs/{ADR_NUMBER}-{JIRA_ID}-{decision-slug}.md`

Reason: {short reason}
```

### Design Doc Created Comment

```md
Design Doc created:

- `docs/designs/{JIRA_ID}-{slug}-design.md`
```

### Workflow Initialized Comment

```md
Workflow initialized:

- `.agents/workflow/current.md`
```

### Workflow Archived Comment

```md
Workflow archived:

- `.agents/workflow/archive/{JIRA_ID}-{slug}.md`
```

If Jira rejects comment visibility options, retry without visibility if the tool allows it. If comments still fail, do not block the workflow; ensure the workflow path is present in the issue description.

## Workflow State Sync

After reading, creating, or updating Jira, update `.agents/workflow/current.md` with:

```md
## Metadata

- Jira ID: {issue_key}
- Jira URL: {issue_url}
- Title: {issue_title}
- Slug: {slug}
- Status: {current_status}
- Owner:
- Created At:
- Updated At:

## Jira Summary

{brief summary of Jira issue}
```

Do not store secrets or sensitive values in workflow state.

## Planning Comment

After the planner/plan-reviewer phase, add one concise Jira comment:

```md
Planning completed.

Docs:

- PRD: `docs/prds/{JIRA_ID}-{slug}.md`
- ADRs: {list or "not required"}
- Design Doc: {path or "not required"}

Summary:

- {short plan summary}

Open Questions:

- {open question or "none"}
```

## Implementation Start Gate

Before implementation starts, the Jira issue must satisfy these requirements:

1. The issue must be linked in `.agents/workflow/current.md`.
2. The issue must be assigned to an active sprint.
3. The issue must have an assignee.

The implementation agent must not edit code until these checks pass.

### Sprint Requirement

Before starting implementation, check whether the issue is in an active sprint using JQL:

```jql
key = {JIRA_ID} AND sprint in openSprints()
```

If the query returns the issue:

- The issue is in an active sprint.
- Continue to assignee check.

If the query does not return the issue:

1. Check whether the issue is in any sprint:

```jql
key = {JIRA_ID} AND sprint is not EMPTY
```

2. If the issue is not in an active sprint, stop implementation.
3. Tell the user:

```text
Implementation blocked: `{JIRA_ID}` is not in an active sprint. Move it to an active sprint in Jira, then ask me to continue.
```

Do not continue implementation if the issue is not in an active sprint.

### Assignee Requirement

Before starting implementation, read the issue using:

- `atlassian_getJiraIssue`

If the issue already has an assignee:

- Continue to transition/start implementation.

If the issue has no assignee:

1. Show known assignable developers from `Project Team`.
2. Ask the user to choose one.
3. Do not implement until the user chooses an assignee or manually assigns the issue in Jira.

Use available Atlassian tools:

- `atlassian_lookupJiraAccountId` to find users by name or email.
- `atlassian_editJiraIssue` to assign the issue.

If the MCP cannot list all assignable users directly, use known project/team candidates or ask the user to provide a name/email.

### Assignee Selection Prompt

When the issue has no assignee, respond with:

```text
The issue `{JIRA_ID}` has no assignee.

Choose who should own this implementation:

1. Iury Vieira Lippo da Silva — iuryvieira.lippo@gmail.com
2. Assign manually in Jira and then continue
3. Provide another developer name/email

Implementation cannot start until the issue has an assignee.
```

After the user selects a person:

1. Use `atlassian_lookupJiraAccountId`.
2. If exactly one account matches, assign using `atlassian_editJiraIssue`.
3. If multiple accounts match, ask the user to choose.
4. If no account matches, ask the user to assign manually in Jira.

### Start Implementation Transition

After sprint and assignee checks pass:

1. Use `atlassian_getTransitionsForJiraIssue`.
2. If an `Em andamento` or `In Progress` transition exists, use `atlassian_transitionJiraIssue`.
3. Add a concise Jira comment using `atlassian_addCommentToJiraIssue` when possible:

```text
Implementation started.
```

4. Update `.agents/workflow/current.md`:

```md
## Implementation Start Gate

- Jira Issue: {JIRA_ID}
- In Active Sprint: yes
- Assignee: {assignee_name}
- Status: {status}
- Decision: implementation allowed
```

Only then may the implementor edit code.

## Implementation Comment

After implementation, add one concise Jira comment:

```md
Implementation completed.

Changed areas:

- {area 1}
- {area 2}

Notes:

- {short implementation notes}
```

## Review Comment

After review, add one concise Jira comment:

```md
Review completed.

Result:

- Approved / Approved with notes / Needs changes

Findings:

- {finding 1}
- {finding 2}
```

## Test/Lint Comment

After tests and lint, add one concise Jira comment:

```md
Validation completed.

Tests:

- `{command}` → passed/failed/not run

Lint/Typecheck:

- `{command}` → passed/failed/not run

Notes:

- {notes}
```

Do not claim commands passed unless they were actually run.

## Transition Rules

Do not transition Jira status unless one of these is true:

1. The user explicitly asks.
2. The workflow rule explicitly allows it.
3. The current agent is responsible for that phase and the transition is low risk.

Before transitioning:

1. Use `atlassian_getTransitionsForJiraIssue`.
2. Pick only a transition that exists.
3. Use `atlassian_transitionJiraIssue`.
4. Do not guess status names.

Suggested transitions:

- After PRD and workflow initialization: `Backlog` → `To Do` or `Ready for Dev`
- When implementation starts: `A fazer` / `To Do` → `Em andamento` / `In Progress`
- When implementation is complete: `Em andamento` / `In Progress` → `Code Review`
- When review passes: `Code Review` → `QA` or `Done`, depending on project workflow
- When tests fail or blockers exist: add comment and avoid transition unless asked

If the target status does not exist in Jira, do not guess. Report available statuses if possible.

## Labels

Apply labels only when useful.

Recommended labels:

- `feature`
- `bug`
- `refactor`
- `technical-debt`
- `security`
- `needs-prd`
- `needs-adr`
- `needs-design-doc`

Do not create excessive labels.

## Priority Rules

Only set priority when the user indicates urgency or impact.

Suggested mapping:

- user says production down, blocker, data loss, auth broken → high/highest
- user says bug but workaround exists → medium
- user says improvement or refactor → low/medium
- user gives no urgency → leave default

## Duplicate Prevention

Before creating a new issue:

1. Search by key terms from the request.
2. Search by affected component.
3. Search unresolved issues first.
4. If a likely duplicate exists, use it instead of creating a new one.
5. If confidence is low, ask the user.

## Security Rules

Never send secrets to Jira.

Do not include:

- API keys
- tokens
- signed URLs
- database credentials
- private `.env` values
- full media token URLs
- private storage credentials
- sensitive customer data

Redact sensitive values:

```text
[REDACTED]
```

## Output Format

When this skill completes, return:

```md
## Jira Automation Result

- Jira ID:
- Jira URL:
- Title:
- Status:
- Action:
- Created/Updated:
- Notes:
```

## Common JQL Queries

### Smoke test project access

```jql
project = {PROJECT_KEY} ORDER BY updated DESC
```

### Find open issues by text

```jql
project = {PROJECT_KEY} AND resolution = Unresolved AND text ~ "{query}" ORDER BY updated DESC
```

### Find open issues by summary

```jql
project = {PROJECT_KEY} AND resolution = Unresolved AND summary ~ "{query}" ORDER BY updated DESC
```

### Find issues by key

```jql
key = {PROJECT_KEY}-123
```

### My open issues

```jql
project = {PROJECT_KEY} AND assignee = currentUser() AND resolution = Unresolved ORDER BY priority DESC, updated DESC
```

### Active sprint check

```jql
key = {PROJECT_KEY}-123 AND sprint in openSprints()
```

### Any sprint check

```jql
key = {PROJECT_KEY}-123 AND sprint is not EMPTY
```

### Stale in progress issues

```jql
project = {PROJECT_KEY} AND status = "In Progress" AND updated < -7d AND resolution = Unresolved ORDER BY updated ASC
```

## Good Jira Comments

Keep comments concise and useful.

Good:

```md
PRD created: `docs/prds/{PROJECT_KEY}-123-{slug}.md`.

Next step: technical planning.
```

Bad:

```md
I started thinking about the feature and will maybe check the code soon.
```

## Final Rule

All Jira operations must go through this skill.

Do not create, update, comment, assign, check sprint readiness, or transition Jira issues from another skill or agent without following this skill.
