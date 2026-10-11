import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_layout_builder.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: AppLayoutBuilder(
      mobileLayout: (context) =>
          _buildLayout(context, maxWidth: AppSpacing.contentMaxWidth),
      tabletLayout: (context) =>
          _buildLayout(context, maxWidth: AppSpacing.tabletFormMaxWidth),
    ),
  );

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
              padding: const EdgeInsets.all(AppSpacing.contentHorizontal),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconsResetEmail,
                      width: AppSpacing.confirmationImageSize,
                      height: AppSpacing.confirmationImageSize,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: AppSpacing.socialSectionGap),
                    Text(
                      'We Sent you an Email to reset your password.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: AppSpacing.confirmationTextSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.socialSectionGap),
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.signIn),
                      child: const Text('Return to Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
