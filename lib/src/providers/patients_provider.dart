import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentality/src/screens/appointments%20screen/appointments_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Patient> patientsList = [];
Provider<List<Patient>> patientsListProvider = Provider((ref) => patientsList);
fetchPatients() async {
  List<Map<String, dynamic>> tempList = [];
  final patientData = await FirebaseFirestore.instance
      .collection('users')
      .doc('xtuUmcVVwQIp3bGqnzJj')
      .collection('patients')
      .get();
  patientData.docs.forEach((element) {
    tempList.add(element.data());
  });
  print(tempList[0]);
}
