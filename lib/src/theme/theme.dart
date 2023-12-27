import 'package:dentality/src/theme/colors.dart';
import 'package:dentality/src/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  final BuildContext context;

  AppThemeData(this.context);

  ThemeData get materialTheme {
    final BorderRadius borderRadius = BorderRadius.circular(8);
    const fonts = Fonts();
    return ThemeData(
      dividerColor: AppColors.green,
      listTileTheme: ListTileThemeData(
        leadingAndTrailingTextStyle: fonts.bodySmall
            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
        iconColor: AppColors.lightBlue,
        titleTextStyle: fonts.headlineSmall
            ?.copyWith(fontSize: 18.sp, color: AppColors.darkTeal),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(30))),
        tileColor: AppColors.teal,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkTeal,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            shadowColor: AppColors.teal,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            foregroundColor: AppColors.lightTeal,
            textStyle: fonts.bodyMedium),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: fonts.bodySmall,
      )),
      scaffoldBackgroundColor: AppColors.lightBlue,
      appBarTheme: AppBarTheme(
        color: AppColors.darkTeal,
        titleSpacing: 0,
        shadowColor: AppColors.teal,
        centerTitle: false,
        foregroundColor: AppColors.lightTeal,
        titleTextStyle: const Fonts()
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.lightTeal),
      ),
      datePickerTheme: DatePickerThemeData(
          yearStyle: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 20.sp),
          dayStyle: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 18.sp),
          backgroundColor: AppColors.lightBlue),
      textTheme: const Fonts(),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.teal),
    );
  }
}
