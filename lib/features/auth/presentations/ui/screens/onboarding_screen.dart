import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../logic/auth_flow_cubit.dart';
import '../../logic/auth_flow_state.dart';
import '../widgets/age_range_field.dart';
import '../widgets/shopper_type_selector.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, viewport) => Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.contentMaxWidth,
            ),
            child: SizedBox(
              height: viewport.maxHeight,
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
                      style: AppStyles.onboardingHeading(
                        Theme.of(context).textTheme,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.onboardingTitleGap),
                    Text(
                      'Who do you shop for?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: AppSpacing.onboardingControlGap),
                    BlocBuilder<AuthFlowCubit, AuthFlowState>(
                      builder: (context, state) => ShopperTypeSelector(
                        value: state.profile.shopperType,
                        onChanged: context.read<AuthFlowCubit>().selectShopper,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.onboardingSectionGap),
                    Text(
                      'How Old are you?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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
      ),
    ),
  );
}
