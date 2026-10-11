import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_themes.dart';
import 'features/auth/data/repositories/local_profile_repository.dart';
import 'features/auth/domain/usecases/update_profile_use_case.dart';
import 'features/auth/presentations/logic/auth_flow_cubit.dart';

void main() {
  final profileRepository = LocalProfileRepository();
  runApp(
    BlocProvider(
      create: (_) => AuthFlowCubit(UpdateProfileUseCase(profileRepository)),
      child: const EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = AppRouter.router;
    return MaterialApp.router(
      title: 'Clot',
      theme: AppThemes.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
