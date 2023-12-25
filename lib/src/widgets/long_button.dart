import 'package:dentality/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    super.key,
    required this.textTheme,
    required this.title,
    required this.onPressed,
  });

  final TextTheme textTheme;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 50.sp),
        width: 250.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.teal, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            title,
            style: textTheme.bodyLarge
                ?.copyWith(color: Colors.white, fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
