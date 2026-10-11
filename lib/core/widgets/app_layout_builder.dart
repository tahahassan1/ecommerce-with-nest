import 'package:flutter/widgets.dart';

import '../theme/app_breakpoints.dart';

/// Selects a layout using the width available from the parent constraints.
///
/// When [tabletLayout] is omitted, the mobile layout is used at every width.
class AppLayoutBuilder extends StatelessWidget {
  final WidgetBuilder mobileLayout;
  final WidgetBuilder? tabletLayout;

  const AppLayoutBuilder({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth >= AppBreakpoints.tablet) {
        return tabletLayout?.call(context) ?? mobileLayout(context);
      }
      return mobileLayout(context);
    },
  );
}
