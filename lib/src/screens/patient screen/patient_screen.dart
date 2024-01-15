import 'package:dentality/src/core/routing/routes.dart';
import 'package:dentality/src/helpers/sizer.dart';
import 'package:dentality/src/providers/patients_provider.dart';
import 'package:dentality/src/screens/appointments%20screen/appointments_screen.dart';
import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final args = ModalRoute.of(context)!.settings.arguments as Patient;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name ?? ''),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.darkTeal,
                radius: 50.sp,
                child: Text(args.name ?? ''),
              ),
              Sizer(
                horizontal: 6.0.sp,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Phone number: ${args.phoneNumber ?? 'Unknown'}',
                      style: textTheme.bodyMedium,
                    ),
                    Text('Email: ${args.email ?? 'Unknown'}')
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    fetchPatients();
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          Sizer(
            vertical: 8.0.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('X-rays',
                  style: textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color: AppColors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Medical History',
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('No significant findings'),
                      IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.historyScreen),
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Last Visit',
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    DateFormat.MMMd().add_jm().format(
                          DateTime.now(),
                        ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chief Complaint',
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text('Gum bleeding')
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
