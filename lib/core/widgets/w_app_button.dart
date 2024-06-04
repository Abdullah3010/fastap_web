import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:lottie/lottie.dart';

class WAppButton extends StatefulWidget {
  const WAppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isFilled = true,
    this.isDisabled = false,
    this.width,
    this.height,
    this.style,
    this.padding,
    this.borderColor,
  });

  final String title;
  final bool isFilled;
  final bool isDisabled;
  final Function()? onTap;
  final double? width;
  final double? height;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  @override
  State<WAppButton> createState() => _WAppButtonState();
}

class _WAppButtonState extends State<WAppButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (!isLoading && !widget.isDisabled) ? onTap : null,
      child: Container(
        width: widget.width ?? 340.w,
        height: isLoading ? 40.h : widget.height ?? 40.h,
        padding: widget.padding ??
            EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: (widget.height ?? 40.h) / 15.h,
            ),
        decoration: BoxDecoration(
          color: getFilledColor(context),
          borderRadius: BorderRadius.circular(10.r),
          border: !widget.isFilled
              ? Border.all(
                  color: widget.borderColor ??
                      (!(widget.isDisabled)
                          ? context.theme.colorScheme.primaryColor300
                          : context.theme.colorScheme.naturalColor90),
                  width: 1.w,
                  strokeAlign: 1.0,
                )
              : null,
        ),
        child: isLoading
            ? Lottie.asset(
                'assets/animations/button_loader.json',
              )
            : Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: widget.style ??
                      context.textTheme.buttonMedium_14.copyWith(
                        color: widget.isFilled
                            ? context.theme.colorScheme.naturalColor0
                            : (!(widget.isDisabled)
                                ? context.theme.colorScheme.primaryColor300
                                : context.theme.colorScheme.naturalColor200),
                      ),
                ),
              ),
      ),
    );
  }

  Color? getFilledColor(BuildContext context) {
    return widget.isFilled
        ? widget.isDisabled
            ? context.theme.colorScheme.buttonColor.withOpacity(0.6)
            : context.theme.colorScheme.buttonColor
        : null;
  }

  Future<void> onTap() async {
    if (!widget.isDisabled) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      await widget.onTap?.call();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
