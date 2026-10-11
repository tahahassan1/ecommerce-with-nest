import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../widgets/auth_page_frame.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_action_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => AuthPageFrame(
    title: 'Forgot Password',
    showBackButton: true,
    onBack: () => context.go(AppRoutes.password),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthTextField(
          label: 'Enter Email address',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        PrimaryActionButton(
          label: 'Continue',
          onPressed: () => context.go(AppRoutes.emailSent),
        ),
      ],
    ),
  );
}
