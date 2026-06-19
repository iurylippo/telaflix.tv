# IXSTREAM-11 - Implement Flutter-native login screen

## Status

Implemented

## Links

- Jira: https://iurylippo.atlassian.net/browse/IXSTREAM-11
- ADRs: Not required
- Design Doc: Not required
- Workflow: `.agents/workflow/current.md`

## Affected Projects

- `src/`

## Problem

Telaflix.TV needs a polished mobile login entry screen that matches the provided Google Stitch visual direction while remaining native to the Flutter app.

## Goal

Implement a Flutter-native mobile login screen with Cinematic Noir styling, the existing Telaflix.TV logo, a glass panel, login fields, gradient `Entrar` CTA, and footer.

## Scope

- Mobile-oriented login screen UI.
- Cinematic Noir background treatment.
- Logo loaded from `assets/images/logo.png`.
- Glass-style login panel.
- Email/login field.
- Password field with visibility toggle.
- Gradient `Entrar` button.
- Footer content consistent with the design direction.
- Placeholder or non-functional submit behavior unless existing auth wiring already exists.
- The app flow should be `SplashScreen` → `LoginScreen` → `HomeScreen`.

## Out of Scope

- New backend authentication integration.
- Account creation, password reset, social login, or MFA flows.
- Long-term auth architecture decisions.
- Desktop/tablet-specific redesign beyond avoiding layout breakage.

## Functional Requirements

- The screen must render as Flutter-native widgets, not embedded HTML.
- The login/email field must be visibly distinct and ready for text input.
- The password field must obscure input by default and expose a show/hide toggle.
- The `Entrar` button must use a gradient treatment and be visibly tappable.
- Submit behavior must navigate to `HomeScreen` as a placeholder until backend auth is introduced in a separate task.

## Non-Functional Requirements

- The UI should match the Cinematic Noir/glassmorphism direction from the provided design.
- The layout should avoid common mobile overflow issues on typical phone screen sizes.
- The implementation should follow existing Flutter project patterns and avoid adding dependencies unless approved.
- No secrets or auth credentials should be introduced.

## Acceptance Criteria

- [x] Login screen is Flutter-native and mobile-oriented.
- [x] Visual styling includes Cinematic Noir background, logo, glass panel, fields, gradient button, and footer.
- [x] Logo is loaded from `assets/images/logo.png`.
- [x] Password field supports show/hide visibility toggle.
- [x] Tapping `Entrar` navigates to Home without introducing backend auth behavior.
- [x] Layout avoids common mobile overflow issues.

## Risks

- The provided Google Stitch HTML/design may require interpretation where Flutter styling differs from HTML/CSS.
- Existing app navigation/auth structure may influence where the screen should be registered.
- Logo asset path or pubspec asset registration may need verification by the planner.

## Open Questions

- Footer copy follows the provided design: `© 2024 Telaflix Entertainment`.
- User confirmed flow: `SplashScreen` → `LoginScreen` → `HomeScreen`.
