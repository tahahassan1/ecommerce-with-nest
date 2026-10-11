# Project Architecture

Organize the application using clean architecture by feature. Keep feature-specific code within its feature rather than grouping the whole application by technical layer.

Each feature should contain:

- `data/` for data sources, models, and repository implementations.
- `domain/` for entities, repository contracts, and use cases.
- `presentations/ui/` for screens and widgets.
- `presentations/ui/layouts/` for feature-specific page compositions and responsive layout variants.
- `presentations/logic/` for Cubits and their states.

## UI Layouts and Responsiveness

- Keep screen-specific layouts in the feature's `presentations/ui/layouts/` directory. Keep reusable, app-wide widgets in `lib/core/widgets/`.
- Use `AppLayoutBuilder` from `lib/core/widgets/app_layout_builder.dart` when a screen needs mobile and tablet layouts. Provide `mobileLayout`; provide `tabletLayout` only when the tablet composition differs. When omitted, the mobile layout is used at every width.
- Use the shared breakpoints in `AppBreakpoints` rather than adding device-width checks or new breakpoint literals in screens.
- Build layouts that adapt to available constraints, use safe areas, and allow content to scroll when it can exceed the available height. Avoid fixed screen-sized dimensions when flexible constraints or scrollable layouts fit the design.

## Theme Files

Use the shared theme files under `lib/core/theme/` as the source of truth for visual design values:

- `app_colors.dart` defines the app color palette through `AppColors`.
- `app_styles.dart` provides shared text styles through `AppStyles`.
- `app_spacing.dart` defines shared spacing, dimensions, and text-size values through `AppSpacing`.
- `app_breakpoints.dart` defines the shared responsive breakpoints through `AppBreakpoints`.
- `app_assets.dart` provides asset path constants through `AppAssets`.
- `app_themes.dart` assembles these tokens into Flutter `ThemeData` and shared component defaults.

Use `context.theme`, `context.colorScheme`, and `context.textTheme` from `lib/core/extensions/theme_extension.dart` to access the active Flutter theme in UI code. Use the token classes for values that need to be specified directly.

## Core Extensions

Keep reusable extensions on Flutter or app types in `lib/core/extensions/`. The theme extension provides `BuildContext` accessors for the active `ThemeData`, `ColorScheme`, and `TextTheme`; it delegates to Flutter's theme rather than maintaining duplicate values.

## Hard-Coding

- Do not hard-code visual design values in screens or widgets. Use `AppColors`, `AppStyles`, `AppSpacing`, and `AppBreakpoints` for colors, typography, spacing, dimensions, and responsive thresholds.
- Do not hard-code asset paths; reference them through `AppAssets`.
- Do not hard-code navigation paths; use the route names or paths defined in `lib/core/router/app_routes.dart`.
- Keep shared values in their appropriate core token or configuration file. Feature-specific content, such as labels and product data, may remain feature-owned; avoid duplicating shared design or configuration values.
