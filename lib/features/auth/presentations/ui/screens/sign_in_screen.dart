import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../widgets/auth_page_frame.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/social_sign_in_button.dart';
import '../widgets/text_link.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => AuthPageFrame(
    title: 'Sign in',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthTextField(
          label: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        PrimaryActionButton(
          label: 'Continue',
          onPressed: () => context.go(AppRoutes.password),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        Center(
          child: TextLink(
            prefix: 'Dont have an Account? ',
            action: 'Create One',
            onPressed: () => context.go(AppRoutes.createAccount),
          ),
        ),
        const SizedBox(
          height: AppSpacing.socialSectionGap * 2 + AppSpacing.sectionGap,
        ),
        SocialSignInButton(
          label: 'Continue With Apple',
          assetPath: AppAssets.iconsApple,
          isSvg: true,
          onPressed: () => _showProviderNotice(context),
        ),
        const SizedBox(height: AppSpacing.socialGap),
        SocialSignInButton(
          label: 'Continue With Google',
          assetPath: AppAssets.iconsGoogle,
          isSvg: true,
          onPressed: () => _showProviderNotice(context),
        ),
        const SizedBox(height: AppSpacing.socialGap),
        SocialSignInButton(
          label: 'Continue With Facebook',
          assetPath: AppAssets.iconsFacebook,
          isSvg: true,
          onPressed: () => _showProviderNotice(context),
        ),
      ],
    ),
  );

  static void _showProviderNotice(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Social sign-in is not connected yet.')),
    );
  }
}
