import 'package:dentality/src/helpers/sizer.dart';
import 'package:dentality/src/theme/colors.dart';
// import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Appointment'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name'),
                  Sizer(
                    horizontal: 8,
                  ),
                  Expanded(child: TextField()),
                  Sizer(
                    horizontal: 8,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Age'),
                  Sizer(
                    horizontal: 8,
                  ),
                  Expanded(child: TextField()),
                  Sizer(
                    horizontal: 8,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Phone Number'),
                  Sizer(
                    horizontal: 8,
                  ),
                  Expanded(child: TextField()),
                  Sizer(
                    horizontal: 8,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Date'),
                  IconButton(
                    onPressed: () => showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2099)),
                    icon: Icon(Icons.calendar_month),
                    color: AppColors.darkTeal,
                    iconSize: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
