# Design Doc Rules

Create a Design Doc only when the task is large, ambiguous, risky, or spans multiple modules.

Design Doc path:

`docs/designs/{JIRA_ID}-{slug}-design.md`

Use Design Docs for:

- database changes
- workers/jobs/queues
- transcoding pipeline changes
- storage/CDN architecture
- authentication/authorization changes
- billing/payment changes
- performance-sensitive features
- app/backend coordination
- multi-step migrations
- changes involving multiple modules

Do not create a Design Doc for small UI changes, simple endpoints, or isolated bug fixes.
