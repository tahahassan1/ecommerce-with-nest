import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/theme/app_spacing.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.fieldHeight,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: context.textTheme.bodyLarge,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
