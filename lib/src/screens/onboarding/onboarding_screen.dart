import 'package:dentality/src/screens/onboarding/widgets/signup_modalsheet.dart';
import 'package:dentality/src/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to ',
                    style: textTheme.displaySmall?.copyWith(fontSize: 28.sp),
                  ),
                  Image.asset(
                    'assets/images/i-Dentify_logo.png',
                    height: 35.h,
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 50.sp),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/i-Dentify_onboarding.png'),
                      Positioned(
                        bottom: 0.h,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 120.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                      )
                    ],
                  )),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 30.0.h),
                child: Text(
                  'Effortlessly manage patient information and records.',
                  style: textTheme.headlineMedium?.copyWith(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              LongButton(
                  textTheme: textTheme,
                  title: 'Get Started',
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) =>
                          const SignupModalSheet(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
