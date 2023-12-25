import 'package:dentality/src/core/routing/routes.dart';
import 'package:dentality/src/screens/appointments/appointments_screen.dart';
import 'package:dentality/src/screens/home/home_screen.dart';
import 'package:dentality/src/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.appointmentsScreen:
        return MaterialPageRoute(
          builder: (_) => const AppointmentsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('There is no screen defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
