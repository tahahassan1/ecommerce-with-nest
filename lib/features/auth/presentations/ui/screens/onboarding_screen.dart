import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/app_layout_builder.dart';
import '../../logic/auth_flow_cubit.dart';
import '../../logic/auth_flow_state.dart';
import '../widgets/age_range_field.dart';
import '../widgets/shopper_type_selector.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: AppLayoutBuilder(
      mobileLayout: (context) =>
          _buildLayout(context, maxWidth: AppSpacing.contentMaxWidth),
      tabletLayout: (context) =>
          _buildLayout(context, maxWidth: AppSpacing.tabletContentMaxWidth),
    ),
  );

  Widget _buildLayout(BuildContext context, {required double maxWidth}) {
    final mediaQuery = MediaQuery.of(context);
    final viewportHeight =
        mediaQuery.size.height -
        mediaQuery.padding.vertical -
        mediaQuery.viewInsets.vertical;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SizedBox(
            height: viewportHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.contentHorizontal,
                vertical: AppSpacing.onboardingVertical,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tell us About yourself',
                    style: AppStyles.onboardingHeading(context.textTheme),
                  ),
                  const SizedBox(height: AppSpacing.onboardingTitleGap),
                  Text(
                    'Who do you shop for?',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppSpacing.onboardingControlGap),
                  BlocBuilder<AuthFlowCubit, AuthFlowState>(
                    builder: (context, state) => ShopperTypeSelector(
                      value: state.profile.shopperType,
                      onChanged: context.read<AuthFlowCubit>().selectShopper,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.onboardingSectionGap),
                  Text('How Old are you?', style: context.textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.onboardingDropdownGap),
                  BlocBuilder<AuthFlowCubit, AuthFlowState>(
                    builder: (context, state) => AgeRangeField(
                      value: state.profile.ageRange,
                      onChanged: context.read<AuthFlowCubit>().selectAgeRange,
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () => context.go(AppRoutes.signIn),
                    child: const Text('Finish'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
