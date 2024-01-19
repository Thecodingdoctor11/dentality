import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentality/src/core/models/patient.dart';
// import 'package:dentality/src/screens/appointments%20screen/appointments_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Patient> patientsList = [];
FutureProvider<List<Patient>> patientsListProvider =
    FutureProvider((ref) => patientsList);
fetchPatients() async {
  List<Patient> tempList = [];
  final patientData = await FirebaseFirestore.instance
      .collection('users')
      .doc('xtuUmcVVwQIp3bGqnzJj')
      .collection('patients')
      .get();
  patientData.docs.forEach((element) {
    tempList.add(Patient.fromJson(element.data()));
  });
  patientsList = tempList;
  print(patientsList.map((e) => e.age));
}
