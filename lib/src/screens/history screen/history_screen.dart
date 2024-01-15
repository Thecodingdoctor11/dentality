import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final menuController = TextEditingController();
  late final otherController = TextEditingController();
  List<String> diseases = [];
  bool other = false;
  final _otherFieldKey = GlobalKey<FormFieldState>();
  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, diseases);
            },
          ),
        ],
        title: const Text('Medical History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0.sp, horizontal: 8.0.sp),
                  child: DropdownMenu(
                      onSelected: (value) {
                        setState(() {
                          if (value == 3) {
                            other = true;
                          } else {
                            other = false;
                          }
                        });
                      },
                      label: const Text('Chronic Diseases'),
                      controller: menuController,
                      textStyle: textTheme.bodySmall,
                      menuStyle: MenuStyle(
                          elevation: MaterialStatePropertyAll(20.sp),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.teal)),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 1, label: 'Diabetes'),
                        DropdownMenuEntry(value: 2, label: 'Hypertension'),
                        DropdownMenuEntry(value: 3, label: 'Other'),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: ElevatedButton(
                    child: const Row(
                      children: [
                        Text('Add'),
                      ],
                    ),
                    onPressed: () {
                      print(diseases);

                      setState(() {
                        if (!diseases.contains(menuController.text) &&
                            menuController.text.isNotEmpty) {
                          diseases.add(other
                              ? otherController.text
                              : menuController.text);
                          // other = true;
                        }
                      });

                      print(diseases.indexOf(menuController.text));
                      print(other);
                    },
                  ),
                )
              ],
            ),
            if (other)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                    key: _otherFieldKey,
                    validator: (value) {
                      if (otherController.text.isEmpty) {
                        'Please enter condition';
                      }
                      return null;
                    },
                    style: textTheme.bodySmall,
                    controller: otherController,
                    decoration: InputDecoration(
                      hintText: 'Add Condition Details',
                      hintStyle: textTheme.bodySmall,
                    )),
              ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conditions:',
                    style: textTheme.displaySmall,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: SizedBox(
                      height: 300,
                      child: diseases.isEmpty
                          ? const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('No signifcant findings'),
                              ],
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('• ${diseases[index]}'),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            diseases.removeAt(index);
                                          });
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                );
                              },
                              itemCount: diseases.length,
                            ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
