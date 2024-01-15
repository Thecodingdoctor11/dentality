import 'package:dentality/src/helpers/sizer.dart';
import 'package:dentality/src/theme/colors.dart';
// import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
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
                  Sizer(
                    horizontal: 8.sp,
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  )),
                  Sizer(
                    horizontal: 8.sp,
                  ),
                ],
              ),
              Row(
                children: [
                  Sizer(
                    horizontal: 8.sp,
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Age',
                    ),
                  )),
                  Sizer(
                    horizontal: 8.sp,
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                    ),
                  )),
                  Sizer(
                    horizontal: 8.sp,
                  ),
                ],
              ),
              Row(
                children: [
                  Sizer(
                    horizontal: 8.sp,
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  )),
                  Sizer(
                    horizontal: 8.sp,
                  ),
                ],
              ),
              Sizer(
                vertical: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedDate != null
                      ? '${DateFormat.MMMd().format(selectedDate!)}, ${selectedTime != null ? selectedTime?.format(context) : 'Please pick a time'}'
                      : 'Select date'),
                  IconButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        builder: (_, child) {
                          return Theme(
                            data: ThemeData.from(
                              colorScheme: Theme.of(context).colorScheme,
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2099),
                        initialDate: DateTime.now(),
                      );
                      if (context.mounted) {
                        final pickedTime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    },
                    icon: const Icon(Icons.calendar_month),
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
