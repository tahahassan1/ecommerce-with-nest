import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';

class BackButtonCircle extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonCircle({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed ?? () => Navigator.of(context).maybePop(),
        child: Padding(
          padding: EdgeInsets.all(
            (AppSpacing.backButtonSize - AppSpacing.iconSize) / 2,
          ),
          child: SvgPicture.asset(AppAssets.iconsArrowLeft),
        ),
      ),
    );
  }
}
