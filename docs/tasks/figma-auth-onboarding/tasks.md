## Goal
Implement the seven authentication and onboarding screens in the linked Figma section with a reusable app theme, responsive Flutter layouts, and working `go_router` navigation.

## Files expected to change
- lib/core/theme/app_colors.dart — define the Figma palette.
- lib/core/theme/app_themes.dart — define app theme and shared text styles.
- lib/main.dart — replace starter demo with the app entry point.
- lib/features/auth/data/... — provide local auth/onboarding repository implementation.
- lib/features/auth/domain/... — define repository contract, model, and use cases.
- lib/features/auth/presentations/logic/... — implement Cubit state and screen-flow logic.
- lib/features/auth/presentations/ui/... — implement screens and focused reusable widgets.
- lib/core/router/... — configure `go_router` routes.
- lib/core/widgets/... — add shared responsive auth controls where reused.
- pubspec.yaml — add latest SDK-compatible Flutter dependencies and local design assets.
- test/widget_test.dart — replace the removed starter-counter expectation with an app entry smoke expectation.
- assets/... — store Figma-provided static images/icons used by the frames.

## Files explicitly off-limits
- Platform-specific files — no platform changes are needed for these screens.

## Acceptance criteria
- [x] All seven frames from the provided Figma section are reachable in the app.
- [x] Layouts use responsive constraints, safe areas, and scrollable content for narrow and short screens.
- [x] Colors, typography, and shared dimensions are centralized in the core theme.
- [x] Route callbacks and onboarding selections are wired to `go_router` and Cubit logic.
- [x] Feature files follow the project clean architecture structure from AGENTS.md.

## Approach
Use Figma design context, screenshots, and provided local assets to reproduce the seven 390×844 mobile frames with `SafeArea`, `LayoutBuilder`, scrollable constraints, and adaptive sizing. Centralize colors, typography, and reusable controls in core; organize auth UI, Cubit, use cases, and repository by feature. Use `go_router` for screen flow and a local repository for the UI-only onboarding choices; do not invent remote auth services.

## Verification
- `dart format lib test` — passed; no changes needed on final formatting pass.
- `flutter pub get` — passed; packages resolved for Dart 3.13.1.
- `flutter analyze` — passed; no issues found.
- Visual reference/asset inspection — Figma frame hierarchy and assets were inspected, and the local logo, provider icons, confirmation illustration, and SVG icons were matched to their code call sites. Runtime screenshot comparison was not performed.
- Tests — not run.
