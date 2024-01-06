import 'package:flutter/material.dart';

class Sizer extends StatelessWidget {
  const Sizer({super.key, this.horizontal = 0, this.vertical = 0});
  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
      width: horizontal,
    );
  }
}
