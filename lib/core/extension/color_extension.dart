import 'package:flutter/material.dart';

extension ColorExtension on ColorScheme {
  // Primary Colors
  Color get primaryColor300 => const Color(0xff7962D5);
  Color get primaryColor400 => const Color.fromARGB(255, 91, 73, 165);
  Color get primaryColor500 => const Color.fromARGB(255, 50, 39, 91);
  Color get primaryColor600 => const Color.fromARGB(255, 44, 33, 79);
  Color get primaryColor700 => const Color.fromARGB(255, 25, 19, 47);

  // Success Colors
  Color get successColor400 => const Color(0xff5aa640);
  Color get successColor500 => const Color(0xff4e9138);

  // Natural Colors
  Color get naturalColor0 => const Color(0xffffffff);
  Color get naturalColor10 => const Color(0xfffafafa);
  Color get naturalColor20 => const Color(0xfff5f5f5);
  Color get naturalColor30 => const Color(0xffececeb);
  Color get naturalColor40 => const Color(0xffe0e0df);
  Color get naturalColor50 => const Color(0xffc3c3c2);
  Color get naturalColor60 => const Color(0xffb5b4b3);
  Color get naturalColor70 => const Color(0xffa9a8a7);
  Color get naturalColor80 => const Color(0xff9b9a98);
  Color get naturalColor90 => const Color(0xff8c8b89);
  Color get naturalColor200 => const Color(0xff706e6c);
  Color get naturalColor400 => const Color(0xff605757);
  Color get naturalColor600 => const Color(0xff3b3936);
  Color get naturalColor700 => const Color(0xff141212);
  Color get naturalColor900 => const Color(0xff000000);

  // Danger Colors
  Color get dangerColor100 => const Color(0xfff8a2b2);
  Color get dangerColor200 => const Color(0xffF44236);
  Color get dangerColor300 => const Color(0xffff002e);

  // Component Colors
  Color get buttonColor => const Color(0xff7962D5);

  // shadow Colors
  Color get shadowColor => const Color(0xff7962fd);
}
