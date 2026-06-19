# IXSTREAM-9 - Adicionar Splash Screen

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-9
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

Ao abrir o app Telaflix.TV, a aplicação não tinha uma tela inicial de carregamento com identidade visual própria antes da Home. Também havia uma transição nativa Android que podia mostrar tela branca, ícone distorcido ou uma experiência visual inconsistente antes do primeiro frame Flutter.

## Goal

Exibir uma splash screen nativa Flutter com gradiente Cinematic Noir, logo local e loader antes de navegar para a Home, reduzindo inconsistências na abertura do app Android.

## Scope

- Criar uma `SplashScreen` Flutter como primeira tela do app.
- Exibir fundo em gradiente, logo `assets/images/logo.png` e loader.
- Manter a logo visível enquanto a splash Flutter estiver aberta.
- Navegar automaticamente para `HomeScreen` após o tempo de carregamento.
- Ajustar launch screen Android para evitar tela branca e ícone nativo distorcido.

## Out of Scope

- Criar fluxo de autenticação ou onboarding.
- Adicionar dependências de splash screen.
- Alterar a Home além da navegação inicial.
- Implementar splash equivalente para iOS nesta tarefa.

## Functional Requirements

- A aplicação deve iniciar em `SplashScreen`.
- A splash deve usar o asset local `assets/images/logo.png`.
- A splash deve exibir loader durante o carregamento.
- A splash deve navegar para `HomeScreen` automaticamente.
- A primeira tela nativa Android não deve exibir tela branca.

## Non-Functional Requirements

- A implementação deve ser nativa Flutter, sem WebView.
- A UI deve ser responsiva para larguras móveis e maiores.
- A solução não deve adicionar novas dependências.
- O build Android debug deve compilar.

## Acceptance Criteria

- [x] Ao abrir o app, não aparece tela branca inicial.
- [x] A splash Flutter exibe gradiente, logo e loader.
- [x] A logo permanece visível durante a splash Flutter.
- [x] A navegação automática leva para a Home.
- [x] Widget test cobre splash antes da Home.
- [x] `flutter test`, `dart analyze` e `flutter build apk --debug` passam.

## Risks

- Android 12+ impõe limitações na splash nativa do sistema e pode mascarar ícones largos.
- A primeira tela nativa não suporta o mesmo comportamento animado da splash Flutter.

## Open Questions

None
