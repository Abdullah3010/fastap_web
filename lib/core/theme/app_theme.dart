import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        // fontFamily: 'Inter',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.black54,
        ),
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffFFFFFF),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              /// label large
              TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                // fontFamily: 'Inter',
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle: MaterialStateProperty.all(
              /// label large
              TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      );
}
