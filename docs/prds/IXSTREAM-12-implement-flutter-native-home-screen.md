# IXSTREAM-12 - Implement Flutter-native home screen

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-12
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/telaflix_app/`

## Problem

O app Telaflix.TV ainda usa uma `HomeScreen` placeholder, então a navegação após o login termina em uma tela sem a identidade visual e a estrutura de conteúdo esperadas para a experiência principal do produto.

## Goal

Implementar uma Home Flutter nativa para mobile, visualmente fiel ao HTML fornecido, com hero principal, prateleiras horizontais de conteúdo, canais ao vivo e navegação inferior fixa.

## Scope

- Substituir a `HomeScreen` placeholder atual por uma home Flutter nativa.
- Abrir a nova Home após o login, preservando o fluxo `SplashScreen` -> `LoginScreen` -> `HomeScreen`.
- Reproduzir a direção visual do HTML enviado com fundo escuro, hero cinematográfico, cartões e overlays.
- Exibir top bar com logo, busca e avatar.
- Exibir seção de hero com metadados, descrição e CTAs.
- Exibir seção `Continuar assistindo` com progresso.
- Exibir seção `Filmes em destaque` com posters verticais.
- Exibir seção `Canais ao vivo` com badge de ao vivo.
- Exibir bottom navigation fixa com `Home` em estado ativo.
- Usar dados mockados locais nesta primeira versão.
- Organizar a feature com widgets de apresentação e mocks locais separados por responsabilidade.

## Out of Scope

- Integração com backend ou APIs reais.
- Reprodução real de mídia.
- Busca funcional.
- Navegação funcional nas abas da bottom nav.
- Persistência de progresso ou perfil do usuário.
- Redesign específico para tablet/desktop além de evitar quebra visual.

## Functional Requirements

- A tela deve ser construída com widgets Flutter nativos, sem HTML embutido.
- O login deve continuar navegando para `HomeScreen` após tocar em `Entrar`.
- A Home deve renderizar os blocos principais do layout aprovado: top bar, hero, prateleiras e bottom nav.
- As listas horizontais devem ser alimentadas por dados mockados locais.
- A implementação deve separar a tela principal, os widgets de apresentação e os dados mockados em arquivos próprios.
- Os CTAs e cards devem fornecer feedback visual de toque mesmo sem ações reais completas.

## Non-Functional Requirements

- A UI deve seguir a direção visual premium escura do HTML fornecido.
- A implementação deve priorizar mobile e evitar overflows em tamanhos comuns de telefone.
- A solução não deve adicionar dependências novas sem necessidade.
- A estrutura deve permanecer simples e pronta para evolução futura para dados reais.

## Acceptance Criteria

- [x] A `HomeScreen` placeholder é substituída por uma home Flutter nativa.
- [x] O fluxo `SplashScreen` -> `LoginScreen` -> `HomeScreen` continua funcionando.
- [x] A Home inclui top bar, hero, `Continuar assistindo`, `Filmes em destaque`, `Canais ao vivo` e bottom nav fixa.
- [x] Os conteúdos exibidos são mockados localmente.
- [x] A feature separa `HomeScreen`, widgets de apresentação e arquivo de mocks locais.
- [x] Testes de widget validam os blocos principais da home e a navegação login -> home.

## Risks

- A equivalência visual entre HTML/CSS e Flutter exigirá interpretação em espaçamento, sombras e comportamento responsivo.
- O uso inicial de imagens remotas para mocks pode introduzir diferenças de carregamento em testes ou ambientes offline.
- A tela pode crescer rápido se a composição não for quebrada em widgets menores desde o início.

## Open Questions

- None
