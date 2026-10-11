import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) context.go(AppRoutes.signIn);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.primary,
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, viewport) => Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.contentMaxWidth,
            ),
            child: SizedBox(
              height: viewport.maxHeight,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.imagesSplashLogo,
                    width: AppSpacing.logoWidth,
                    height: AppSpacing.logoHeight,
                    fit: BoxFit.contain,
                  ),
                  const Positioned(
                    bottom: AppSpacing.sectionGap,
                    child: SafeArea(
                      top: false,
                      child: SizedBox(
                        width: AppSpacing.logoWidth * .765,
                        height: AppSpacing.fieldRadius + 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSpacing.buttonRadius),
                            ),
                          ),
                        ),
                      ),
                    ),
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
