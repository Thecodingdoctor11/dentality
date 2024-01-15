import 'package:dentality/src/core/authentication/providers/auth_provider.dart';
import 'package:dentality/src/screens/home%20screen/home_screen.dart';
import 'package:dentality/src/screens/onboarding/onboarding_screen.dart';
import 'package:dentality/src/screens/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (user) {
          if (user != null) {
            return const HomeScreen();
          }
          return const OnboardingScreen();
        },
        error: ((error, stackTrace) => const OnboardingScreen()),
        loading: () => const SplashScreen());
  }
}
