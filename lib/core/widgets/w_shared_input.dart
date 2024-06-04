import 'dart:io';

import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WSharedInput extends StatefulWidget {
  const WSharedInput({
    required this.textEditingController,
    this.fieldKey,
    this.title,
    this.hint,
    this.height,
    this.width,
    this.isPassword = false,
    this.validator,
    this.textInputType,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.isCenter = false,
    this.enabled = true,
    this.isDate = false,
    this.onChanged,
    this.customDecoration,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.focusNode,
    this.filled = true,
    this.filledColor,
    this.hintStyle,
    this.textInputAction,
    this.inputHeight,
    super.key,
    this.suffixIcon,
    this.suffixIconWidget,
    this.onSuffixIconTap,
    this.isPhoneNumber = false,
    this.prefixIconWidget,
  });
  final GlobalKey<FormFieldState>? fieldKey;
  final String? title;
  final String? hint;
  final String? suffixIcon;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final InputDecoration? customDecoration;
  final double? height;
  final int? maxLines;
  final int? minLines;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final bool isCenter;
  final bool enabled;
  final bool isDate;
  final bool? readOnly;
  final Function? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? filledColor;
  final bool? filled;
  final TextStyle? hintStyle;
  final double? inputHeight;
  final void Function()? onSuffixIconTap;
  final bool? isPhoneNumber;

  @override
  State<WSharedInput> createState() => _WSharedInputState();
}

class _WSharedInputState extends State<WSharedInput> {
  final ValueNotifier<bool> changeObscure = ValueNotifier<bool>(true);
  final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();
  bool firstWordIsEnglish = false;
  bool obscureValue = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: changeObscure,
      builder: (BuildContext context, bool value, _) {
        obscureValue = value;

        return Column(
          children: [
            if (widget.title != null)
              Row(
                children: [
                  Text(
                    widget.title ?? '',
                    style: context.textTheme.bodyRegular_16,
                  ),
                ],
              ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 346.w,
              // height: 41.h,
              child: Stack(
                children: [
                  InkWell(
                    onTap: widget.enabled ? null : onTextFormFieldTap,
                    child: TextFormField(
                      key: widget.fieldKey ?? fieldKey,
                      enabled: widget.enabled,
                      minLines: widget.minLines ?? 1,
                      maxLines: widget.maxLines ?? 1,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      focusNode: widget.focusNode,
                      onTap: onTextFormFieldTap,
                      readOnly: widget.readOnly ?? false,
                      controller: widget.textEditingController,
                      keyboardType: widget.textInputType,
                      textInputAction: widget.textInputAction ?? TextInputAction.done,
                      enableInteractiveSelection: true,
                      obscureText: widget.isPassword ? obscureValue : false,
                      style: context.textTheme.bodyRegular_16.copyWith(
                        color: context.theme.colorScheme.naturalColor600,
                      ),
                      onChanged: onTextFormFiledChange,
                      cursorHeight: 15.h,
                      decoration: widget.customDecoration ??
                          InputDecoration(
                            filled: widget.filled,
                            fillColor: widget.filledColor ?? context.theme.colorScheme.naturalColor0,
                            errorStyle: context.theme.textTheme.bodyRegular_14.copyWith(
                              color: context.theme.colorScheme.dangerColor300,
                            ),
                            hintStyle: widget.hintStyle ??
                                context.textTheme.bodyRegular_16.copyWith(
                                  color: context.theme.colorScheme.naturalColor400,
                                  decoration: TextDecoration.none,
                                ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10.r,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                            ),
                            disabledBorder: widget.isDate
                                ? OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                  )
                                : null,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                            ),
                            hintText: widget.hint,
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                              right: 50.w,
                              left: (widget.prefixIconWidget != null) ? 60.w : 10.w,
                              bottom: widget.inputHeight ?? 18.h,
                            ),
                          ),
                      validator: widget.validator,
                      inputFormatters: widget.inputFormatters,
                    ),
                  ),

                  /// [Suffix Icon]
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 50.w,
                      height: 40.h,
                      child: widget.suffixIconWidget ??
                          (!widget.isPassword && widget.suffixIcon != null
                              ? InkWell(
                                  onTap: widget.onSuffixIconTap,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 15.h,
                                    ),
                                    child: SvgPicture.asset(
                                      widget.suffixIcon ?? '',
                                      colorFilter: ColorFilter.mode(
                                        !isError
                                            ? widget.textEditingController.text.isNotEmpty
                                                ? context.theme.colorScheme.primaryColor300
                                                : context.theme.colorScheme.naturalColor60
                                            : context.theme.colorScheme.dangerColor200,
                                        BlendMode.srcIn,
                                      ),
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: onSuffixPasswordIconTap,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 10.h,
                                    ),
                                    child: widget.isPassword
                                        ? SvgPicture.asset(
                                            obscureValue
                                                ? Assets.icons.outlineEyeNo.path
                                                : Assets.icons.outlineEyeYes.path,
                                            colorFilter: ColorFilter.mode(
                                              context.theme.colorScheme.naturalColor200,
                                              BlendMode.srcIn,
                                            ),
                                            width: 24.w,
                                            height: 24.h,
                                          )
                                        : null,
                                  ),
                                )),
                    ),
                  ),

                  /// [Prefix Icon]
                  if (widget.prefixIconWidget != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 60.w,
                        height: 40.h,
                        child: Row(
                          children: [
                            12.createHorizontalGap(),
                            widget.prefixIconWidget ?? const SizedBox(),
                            12.createHorizontalGap(),
                            VerticalDivider(
                              width: 2.w,
                              color: context.theme.colorScheme.naturalColor200,
                              thickness: 1.5,
                              indent: 10.h,
                              endIndent: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void onTextFormFieldTap() {
    // ignore: invalid_use_of_protected_member
    if ((widget.focusNode?.hasListeners ?? false) && widget.textInputType == TextInputType.number && Platform.isIOS) {
      widget.focusNode?.requestFocus();
    }
    if (widget.focusNode != null && widget.textInputType == TextInputType.number && Platform.isIOS) {}
    if (widget.onTap != null) {
      widget.onTap?.call();
    }
  }

  void onTextFormFiledChange(String value) {
    if (!(fieldKey.currentState?.validate() ?? false)) {
      isError = true;
    } else {
      isError = false;
    }
    if (widget.onChanged != null) {
      widget.onChanged?.call(value);
    }

    setState(() {});
  }

  void onSuffixPasswordIconTap() {
    changeObscure.value = !obscureValue;
  }
}
