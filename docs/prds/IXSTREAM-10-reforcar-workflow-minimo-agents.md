# IXSTREAM-10 - Reforçar Workflow Mínimo dos Agents

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-10
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `.opencode/`
- `.agents/`
- `AGENTS.md`

## Problem

O fluxo anterior permitia que uma feature pequena fosse tratada como mudança rápida, pulando Jira, PRD e workflow state. Isso criou inconsistência entre as regras esperadas do repositório e a execução real dos agents.

## Goal

Reforçar as instruções do repositório e dos agents para que qualquer feature, bug, refactor ou mudança de comportamento tratada pelo planner siga o fluxo mínimo obrigatório, mesmo quando pequena.

## Scope

- Atualizar `AGENTS.md` com a regra Jira-first para tarefas planner-handled.
- Definir workflow mínimo obrigatório para tarefas pequenas reais.
- Ajustar o `planner` para não classificar features, UI flows, runtime bugfixes e refactors como `quick-fix` sem pedido explícito local-only.
- Ajustar o `brainstormer` para criar PRD curto e registrar decisões de ADR/Design Doc como não necessárias quando aplicável.

## Out of Scope

- Criar novos agents.
- Alterar permissões de ferramentas.
- Alterar schema do `opencode.json`.
- Automatizar criação de Jira via plugin.

## Functional Requirements

- `quick-fix` deve ficar restrito a mudanças puramente mecânicas ou local-only explícitas.
- `standard-task` deve exigir Jira, PRD quando feature, workflow state e plano técnico.
- ADR, Design Doc e plan-reviewer devem continuar opcionais para tarefas pequenas de baixo risco.
- Brainstormer deve registrar decisões documentais quando ADR/Design Doc não forem necessários.

## Non-Functional Requirements

- As instruções devem ser claras e compatíveis com a estrutura atual dos agents.
- As mudanças não devem exigir alteração de dependências ou scripts.

## Acceptance Criteria

- [x] `AGENTS.md` define workflow mínimo para tasks pequenas reais.
- [x] `planner` proíbe `quick-fix` para features/bugs/refactors de comportamento sem pedido local-only explícito.
- [x] `brainstormer` exige PRD curto para features pequenas.
- [x] ADR/Design Doc são registrados como não requeridos quando não justificáveis.

## Risks

- O fluxo pode adicionar overhead a tarefas pequenas, mas esse é um trade-off aceito para manter rastreabilidade.

## Open Questions

None
