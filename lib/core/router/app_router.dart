import 'package:go_router/go_router.dart';

import '../../features/auth/presentations/ui/screens/create_account_screen.dart';
import '../../features/auth/presentations/ui/screens/email_sent_screen.dart';
import '../../features/auth/presentations/ui/screens/forgot_password_screen.dart';
import '../../features/auth/presentations/ui/screens/onboarding_screen.dart';
import '../../features/auth/presentations/ui/screens/password_screen.dart';
import '../../features/auth/presentations/ui/screens/sign_in_screen.dart';
import '../../features/auth/presentations/ui/screens/splash_screen.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: AppRoutes.signIn, builder: (_, _) => const SignInScreen()),
      GoRoute(
        path: AppRoutes.password,
        builder: (_, _) => const PasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.createAccount,
        builder: (_, _) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (_, _) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.emailSent,
        builder: (_, _) => const EmailSentScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, _) => const OnboardingScreen(),
      ),
    ],
  );
}
