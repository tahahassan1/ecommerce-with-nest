import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/theme/app_colors.dart';

class TextLink extends StatelessWidget {
  final String prefix;
  final String action;
  final VoidCallback onPressed;

  const TextLink({
    super.key,
    required this.prefix,
    required this.action,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      Text(prefix, style: context.textTheme.bodySmall),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: AppColors.textPrimary,
        ),
        child: Text(
          action,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ],
  );
}
