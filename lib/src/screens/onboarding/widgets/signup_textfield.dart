import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupTextField extends StatelessWidget {
  const SignupTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obsecureText = false,
    this.validator,
    this.icon,
    this.onTap,
    this.keyboardType,
    this.onSaved,
  });
  final String hint;
  final TextEditingController controller;
  final bool obsecureText;
  final FormFieldValidator? validator;
  final Widget? icon;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onSaved,
        keyboardType: keyboardType ?? TextInputType.text,
        key: ValueKey(hint),
        validator: validator ?? (value) => null,
        obscureText: obsecureText,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: icon,
          errorStyle: TextStyle(fontSize: 14.sp),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.green),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.green),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.teal),
              borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
