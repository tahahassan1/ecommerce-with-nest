import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_spacing.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                padding: const EdgeInsets.all(AppSpacing.contentHorizontal),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewport.maxHeight),
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
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
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
      ),
    ),
  );
}
