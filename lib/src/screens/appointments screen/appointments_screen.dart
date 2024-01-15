import 'package:dentality/src/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:dentality/src/theme/colors.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final Patient patientData = Patient(
      age: 20,
      name: 'John Doe',
      gender: Gender.male,
      history: MedicalHistory.medicallyFree,
      phoneNumber: '01000101101',
      email: 'test@test.com');
  late final Appointment appointment = Appointment(
      patient: patientData,
      patientName: patientData.name,
      date: DateTime.now());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: const Row(
                        children: [
                          Text(
                            'Sort by',
                          ),
                          Icon(Icons.filter_alt_outlined),
                        ],
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
            Flexible(
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () => Navigator.of(context).pushNamed(
                            Routes.patientScreen,
                            arguments: patientData),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        tileColor: AppColors.teal,
                        title: Text(
                          '${appointment.patientName}, ${appointment.patient.age} years',
                          style: textTheme.headlineSmall
                              ?.copyWith(fontSize: 16.sp),
                        ),
                        leading: Text(
                          DateFormat.MMMd().add_jm().format(
                                DateTime.now(),
                              ),
                          style: textTheme.bodySmall?.copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert_outlined),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final Patient patient;
  DateTime? date;
  DateTime? lastVisit;
  String? patientName;
  String? patientAge;

  Appointment(
      {required this.patient,
      this.date,
      this.lastVisit,
      this.patientAge,
      this.patientName});
}

enum Gender { male, female }

enum MedicalHistory { medicallyFree, medicallyCompromised }

class Patient {
  String? name;
  int? age;
  Gender? gender;
  MedicalHistory? history;
  String? phoneNumber;
  String? email;
  String? picture;

  Patient({
    this.name,
    this.age,
    this.gender,
    this.history,
    this.phoneNumber,
    this.email,
    this.picture,
  });
}
