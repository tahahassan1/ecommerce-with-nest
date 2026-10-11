import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../widgets/auth_page_frame.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/text_link.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => AuthPageFrame(
    title: 'Sign in',
    showBackButton: true,
    onBack: () => context.go(AppRoutes.signIn),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthTextField(label: 'Password', obscureText: true),
        const SizedBox(height: AppSpacing.sectionGap),
        PrimaryActionButton(
          label: 'Continue',
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign-in service is not connected yet.'),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        TextLink(
          prefix: 'Forgot Password? ',
          action: 'Reset',
          onPressed: () => context.go(AppRoutes.forgotPassword),
        ),
      ],
    ),
  );
}
