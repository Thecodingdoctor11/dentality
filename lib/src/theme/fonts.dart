import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fonts extends TextTheme {
  const Fonts();
  @override
  TextStyle? get bodyLarge => TextStyle(fontFamily: 'Exo2', fontSize: 28.sp);
  @override
  TextStyle? get bodyMedium => TextStyle(fontFamily: 'Exo2', fontSize: 24.sp);
  @override
  TextStyle? get bodySmall => TextStyle(fontFamily: 'Exo2', fontSize: 22.sp);
  @override
  TextStyle? get labelLarge => TextStyle(
      fontFamily: 'Exo2', fontSize: 28.sp, fontWeight: FontWeight.w300);
  @override
  TextStyle? get labelMedium => TextStyle(
      fontFamily: 'Exo2', fontSize: 24.sp, fontWeight: FontWeight.w300);
  @override
  TextStyle? get labelSmall => TextStyle(
      fontFamily: 'Exo2', fontSize: 22.sp, fontWeight: FontWeight.w300);
  @override
  TextStyle? get headlineLarge => TextStyle(
      fontFamily: 'Exo2', fontSize: 28.sp, fontWeight: FontWeight.w700);
  @override
  TextStyle? get headlineMedium => TextStyle(
        fontFamily: 'Exo2',
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      );
  @override
  TextStyle? get headlineSmall => TextStyle(
      fontFamily: 'Exo2', fontSize: 22.sp, fontWeight: FontWeight.w700);
  @override
  TextStyle? get displayLarge => TextStyle(
      fontFamily: 'Exo2',
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
  @override
  TextStyle? get displayMedium => TextStyle(
      fontFamily: 'Exo2',
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
  @override
  TextStyle? get displaySmall => TextStyle(
      fontFamily: 'Exo2',
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
}
