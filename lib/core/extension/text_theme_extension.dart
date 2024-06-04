import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExtension on TextTheme {
  /// [H1]
  TextStyle get h1SemiBold_28 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 28.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get h1SemiBold_18 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get h1MediumItalic_24 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
        fontStyle: FontStyle.italic,
        //fontFamily: 'Inter',
      );

  /// [Titles]
  TextStyle get titleSemiBold_18 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get titleMedium_28 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get titleMedium_18 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get titleMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get titleRegular_18 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        //fontFamily: 'Inter',
      );

  /// [Body]
  TextStyle get bodyMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get bodyMedium_14 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        //fontFamily: 'Inter',
        letterSpacing: -0.30.w,
      );

  TextStyle get bodyRegular_16 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get bodyRegular_14 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        letterSpacing: -0.30.w,
        //fontFamily: 'Inter',
      );

  /// [Button]
  TextStyle get buttonMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get buttonMedium_14 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        //fontFamily: 'Inter',
        letterSpacing: -0.30.w,
      );

  TextStyle get buttonMedium_12 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        //fontFamily: 'Inter',
      );

  /// [Text line]
  TextStyle get textLineMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        fontSize: 16.sp,
        //fontFamily: 'Inter',
      );

  TextStyle get textLineRegular_14 => TextStyle(
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        fontSize: 14.sp,
        //fontFamily: 'Inter',
      );
}
