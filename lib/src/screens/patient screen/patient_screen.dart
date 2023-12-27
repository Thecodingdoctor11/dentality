import 'package:dentality/src/screens/appointments/appointments_screen.dart';
import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Patient;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          CircleAvatar(
            backgroundColor: AppColors.darkTeal,
            radius: 50.sp,
            child: const Text('hello, world'),
          )
        ]),
      ),
    );
  }
}
