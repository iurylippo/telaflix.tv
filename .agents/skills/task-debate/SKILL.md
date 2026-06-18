# Skill: Task Debate

Use this skill from the brainstormer agent when the user gives a new feature, bug, refactor, or technical request.

Steps:

1. Restate the request.
2. Identify affected project/directory.
3. Use `.agents/skills/jira-automation.md`.
4. Read existing Jira issue if ID was provided.
5. Search or create Jira issue if no ID exists.
6. Generate a slug from the Jira title.
7. Decide required docs:
   - PRD: yes for non-trivial features.
   - ADR: only if long-term technical decision exists.
   - Design Doc: only if large, risky, or multi-module.
8. Initialize `.agents/workflow/current.md`.
9. Do not implement code.
10. Ask for approval before handing off to planner.
