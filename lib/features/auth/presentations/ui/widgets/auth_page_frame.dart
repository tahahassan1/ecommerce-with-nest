import 'package:flutter/material.dart';

import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_styles.dart';
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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewport) => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.contentMaxWidth,
              ),
              child: SizedBox(
                height: viewport.maxHeight,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: viewport.maxHeight),
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
                          Text(
                            title,
                            style: AppStyles.heading(
                              Theme.of(context).textTheme,
                            ),
                          ),
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
        ),
      ),
    );
  }
}
