import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';

class SocialSignInButton extends StatelessWidget {
  final String label;
  final String assetPath;
  final bool isSvg;
  final VoidCallback onPressed;

  const SocialSignInButton({
    super.key,
    required this.label,
    required this.assetPath,
    required this.onPressed,
    this.isSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.buttonHeight,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          side: BorderSide.none,
          shape: const StadiumBorder(),
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        icon: isSvg
            ? SvgPicture.asset(
                assetPath,
                width: AppSpacing.iconSize,
                height: AppSpacing.iconSize,
              )
            : Image.asset(
                assetPath,
                width: AppSpacing.iconSize,
                height: AppSpacing.iconSize,
              ),
        label: Text(label),
      ),
    );
  }
}
