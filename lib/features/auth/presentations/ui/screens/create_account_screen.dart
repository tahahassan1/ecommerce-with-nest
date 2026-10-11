import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../widgets/auth_page_frame.dart';
import '../widgets/form_field_group.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/text_link.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) => AuthPageFrame(
    title: 'Create Account',
    showBackButton: true,
    onBack: () => context.go(AppRoutes.signIn),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormFieldGroup(
          fields: ['Firstname', 'Lastname', 'Email Address', 'Password'],
        ),
        const SizedBox(height: AppSpacing.socialSectionGap * 2),
        PrimaryActionButton(
          label: 'Continue',
          onPressed: () => context.go(AppRoutes.onboarding),
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
