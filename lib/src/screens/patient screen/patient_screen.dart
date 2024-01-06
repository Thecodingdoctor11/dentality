import 'package:dentality/src/helpers/sizer.dart';
import 'package:dentality/src/screens/appointments/appointments_screen.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.darkTeal,
                radius: 50.sp,
                child: Text(args.name ?? ''),
              ),
              const Sizer(
                horizontal: 6.0,
              ),
              const Expanded(
                child: Text('Phone number: 01000000000'),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
          const Sizer(
            vertical: 8,
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
                  Text('No significant findings')
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
