## Goal
Replace direct app UI calls to `Theme.of(context)` with the shared `BuildContext` theme extension.

## Files expected to change
- `lib/features/auth/presentations/ui/widgets/auth_page_frame.dart` — read heading text theme through the extension.
- `lib/features/auth/presentations/ui/widgets/auth_text_field.dart` — read body text style through the extension.
- `lib/features/auth/presentations/ui/screens/email_sent_screen.dart` — read the confirmation heading style through the extension.
- `lib/features/auth/presentations/ui/screens/onboarding_screen.dart` — read onboarding and body styles through the extension.
- `lib/features/auth/presentations/ui/widgets/social_sign_in_button.dart` — read the button text style through the extension.
- `lib/features/auth/presentations/ui/widgets/text_link.dart` — read link text styles through the extension.

## Files explicitly off-limits
- `lib/core/extensions/theme_extension.dart` — keep the shared extension API unchanged.
- Theme configuration and token files — no design changes are part of this refactor.

## Acceptance criteria
- [x] App UI code uses `context.textTheme` or `context.theme` instead of direct `Theme.of(context)` calls.
- [x] The extension implementation remains the only direct `Theme.of` call in `lib/`.
- [x] Updated Dart files are formatted.

## Approach
Import `theme_extension.dart` in each affected file and replace each theme lookup with the matching context accessor. Preserve all existing style choices and other widget behavior.

## Verification
- `dart format` completed for all six changed UI files.
- `rg -n "Theme\\.of\\(" lib` found only the delegation inside `theme_extension.dart`.
- `git diff --check` completed without whitespace errors.
