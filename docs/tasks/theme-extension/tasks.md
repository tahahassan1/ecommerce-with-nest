## Goal
Add a reusable theme extension in `lib/core/extensions/` and document how to use it.

## Files expected to change
- `lib/core/extensions/theme_extension.dart` — expose common theme values through `BuildContext`.
- `AGENTS.md` — explain the extension and its intended use.

## Files explicitly off-limits
- Existing theme token files — retain the current source of truth.

## Acceptance criteria
- [x] Extension exposes the app theme, color scheme, and text theme without duplicating values.
- [x] `AGENTS.md` documents the extension folder and usage.
- [x] Existing theme APIs remain unchanged.

## Approach
Add a `BuildContext` extension in the new core extensions folder that delegates to Flutter's `Theme.of(context)` and provides convenient theme/color/text accessors. Update the theme guidance in `AGENTS.md` to direct UI code to use it.

## Verification
- Inspected the extension and documentation changes; the accessors delegate to Flutter's `Theme.of(context)`.
- Tests/analyzer were not run.
