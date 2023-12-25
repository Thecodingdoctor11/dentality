import 'package:dentality/firebase_options.dart';
import 'package:dentality/src/core/routing/app_router.dart';
import 'package:dentality/src/screens/onboarding/onboarding_screen.dart';
import 'package:dentality/src/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MainApp(appRouter: AppRouter())));
}

class MainApp extends ConsumerWidget {
  final AppRouter appRouter;
  const MainApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppThemeData(context).materialTheme,
          debugShowCheckedModeBanner: false,
          home: child,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
      child: const OnboardingScreen(),
    );
  }
}
