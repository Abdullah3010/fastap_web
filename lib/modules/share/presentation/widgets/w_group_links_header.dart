import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WGroupLinksHeader extends StatelessWidget {
  const WGroupLinksHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.0,
            0.2,
          ],
          colors: [
            context.theme.colorScheme.naturalColor20,
            context.theme.colorScheme.primaryColor400,
          ],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: context.theme.textTheme.bodyMedium_16.copyWith(
            color: context.theme.colorScheme.naturalColor0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
