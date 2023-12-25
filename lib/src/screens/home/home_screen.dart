import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentality/firebase_options.dart';
import 'package:dentality/src/core/routing/routes.dart';
import 'package:dentality/src/helpers/auth_helper.dart';
import 'package:dentality/src/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeViewScreenState();
}

class HomeViewScreenState extends ConsumerState {
  final List gridItems = [
    'Appointments',
    'Patients',
    'Materials',
    'Expenses',
  ];
  final auth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final textTheme = Theme.of(context).textTheme;
    String name = 'Muhammad';
    final nameProvider = StateProvider<String>((ref) => name);

    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthHelper.signOut();
              Navigator.of(context).pushNamed(Routes.onboardingScreen);
            },
            icon: const Icon(Icons.settings),
          )
        ],
        title: Image.asset(
          'assets/images/i-Dentify_logo.png',
          height: 35.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer(
                  builder: (context, ref, child) => Text(
                      'Hello, Dr. ${ref.watch(nameProvider)}!',
                      style: textTheme.headlineMedium
                          ?.copyWith(color: AppColors.teal)),
                ),
              ),
              SizedBox(
                height: 380.h,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int tileOrder) {
                    return GestureDetector(
                      onTap: () async {
                        FirebaseFirestore.instance
                            .collection('name/GrmovTk3OxxwAIFQ9oo2/nameField')
                            .snapshots()
                            .listen((event) {
                          String firebaseName = event.docs[0]['name'];
                          ref
                              .read(nameProvider.notifier)
                              .update((state) => firebaseName);
                        });
                        Navigator.of(context)
                            .pushNamed('/${gridItems[tileOrder]}');
                        print(await auth?.getIdToken().then((value) => value));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                            ),
                            BoxShadow(
                              color: Colors.teal,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.sp)),
                          gradient: const LinearGradient(
                            colors: [AppColors.teal, AppColors.lightTeal],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            gridItems[tileOrder],
                            style: textTheme.displaySmall?.copyWith(
                                fontSize: 16.sp, color: AppColors.lightTeal),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: gridItems.length,
                ),
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Appointment',
                      style: textTheme.headlineMedium
                          ?.copyWith(color: AppColors.green),
                    ),
                    Icon(
                      Icons.add_alarm_outlined,
                      size: 30.sp,
                      color: AppColors.green,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Patient',
                      style: textTheme.headlineMedium
                          ?.copyWith(color: AppColors.green),
                    ),
                    Icon(
                      Icons.add_reaction_outlined,
                      size: 30.sp,
                      color: AppColors.green,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
