import 'package:dentality/src/core/routing/routes.dart';
import 'package:dentality/src/screens/add%20appointment%20screen/add_appointment_screen.dart';
import 'package:dentality/src/screens/appointments%20screen/appointments_screen.dart';
import 'package:dentality/src/screens/history%20screen/history_screen.dart';
import 'package:dentality/src/screens/home%20screen/home_screen.dart';
import 'package:dentality/src/screens/onboarding/onboarding_screen.dart';
import 'package:dentality/src/screens/patient%20screen/patient_screen.dart';
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
      case Routes.historyScreen:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      case Routes.addAppointmentScreen:
        return MaterialPageRoute(
          builder: (_) => const AddAppointmentScreen(),
        );
      case Routes.patientScreen:
        return MaterialPageRoute(
            builder: (_) => const PatientScreen(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('There is no screen defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
