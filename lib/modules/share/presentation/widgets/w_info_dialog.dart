import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/core/utils/helpers/app_alert.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WInfoDialog extends StatelessWidget {
  const WInfoDialog({super.key, required this.contactInfo});

  final MContactInfo contactInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 400.w,
          // height: 300.h,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.naturalColor0,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  contactInfo.storeLinkType == StoreLinkType.Location
                      ? Assets.icons.locationFilled.path
                      : contactInfo.icon ?? '',
                ),
              ),
              10.createVerticalGap(),
              Center(
                child: Text(
                  contactInfo.name ?? '',
                ),
              ),
              15.createVerticalGap(),
              MaterialButton(
                onPressed: () {
                  String data = ((contactInfo.mainValue?.contains('${Constants.common.separator}A') ?? false) ||
                          (contactInfo.mainValue?.contains('${Constants.common.separator}D') ?? false))
                      ? contactInfo.mainValue?.split(Constants.common.separator).first ?? ''
                      : contactInfo.mainValue ?? '';
                  Clipboard.setData(
                    ClipboardData(text: data),
                  );
                  AppAlert.success('Copied to clipboard');
                },
                child: Container(
                  width: 300.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: context.theme.colorScheme.primaryColor300,
                      width: 2.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ((contactInfo.mainValue?.contains('${Constants.common.separator}A') ?? false) ||
                                (contactInfo.mainValue?.contains('${Constants.common.separator}D') ?? false))
                            ? contactInfo.mainValue?.split(Constants.common.separator).first ?? ''
                            : contactInfo.mainValue ?? '',
                        style: context.theme.textTheme.titleMedium_18,
                      ),
                      10.createHorizontalGap(),
                      const Spacer(),
                      Icon(
                        Icons.copy,
                        color: context.theme.colorScheme.primaryColor300,
                      ),
                    ],
                  ),
                ),
              ),

              // InkWell(

              //   child: Container(
              //
              //     child: Row(
              //       children: [
              //         Text(
              //           ((contactInfo.mainValue?.contains('${Constants.common.separator}A') ?? false) ||
              //                   (contactInfo.mainValue?.contains('${Constants.common.separator}D') ?? false))
              //               ? contactInfo.mainValue?.split(Constants.common.separator).first ?? ''
              //               : contactInfo.mainValue ?? '',
              //           style: context.theme.textTheme.titleMedium_18,
              //         ),
              //         10.createHorizontalGap(),
              //         // const Spacer(),
              //         Icon(
              //           Icons.copy,
              //           color: context.theme.colorScheme.primaryColor300,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
