import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/app_layout_builder.dart';
import 'back_button_circle.dart';

class AuthPageFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showBackButton;
  final VoidCallback? onBack;

  const AuthPageFrame({
    super.key,
    required this.title,
    required this.child,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayoutBuilder(
        mobileLayout: (context) =>
            _buildLayout(context, maxWidth: AppSpacing.contentMaxWidth),
        tabletLayout: (context) =>
            _buildLayout(context, maxWidth: AppSpacing.tabletFormMaxWidth),
      ),
    );
  }

  Widget _buildLayout(BuildContext context, {required double maxWidth}) {
    final mediaQuery = MediaQuery.of(context);
    final viewportHeight =
        mediaQuery.size.height -
        mediaQuery.padding.vertical -
        mediaQuery.viewInsets.vertical;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SizedBox(
            height: viewportHeight,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.contentHorizontal,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: showBackButton
                            ? AppSpacing.backButtonTop
                            : AppSpacing.pageTop +
                                  AppSpacing.backButtonSize +
                                  AppSpacing.headingTopGap,
                      ),
                      if (showBackButton) ...[
                        BackButtonCircle(onPressed: onBack),
                        const SizedBox(height: AppSpacing.headingTopGap),
                      ],
                      Text(title, style: AppStyles.heading(context.textTheme)),
                      const SizedBox(height: AppSpacing.sectionGap * 2),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
