import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox createHorizontalGap() {
    return SizedBox(
      width: toDouble(),
    );
  }

  SizedBox createVerticalGap() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
