import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WLinkStoreContainer extends StatelessWidget {
  const WLinkStoreContainer({
    super.key,
    required this.contactInfoList,
    required this.phons,
  });

  final List<MContactInfo> contactInfoList;
  final List<MContactInfo> phons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 15,
          children: phons
              .map(
                (info) => InkWell(
                  onTap: () {
                    Modular.get<ShareCubit>().onContactInfoTap(info);
                  },
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryColor300,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: context.theme.colorScheme.naturalColor0,
                          size: 15.sp,
                        ),
                        10.createHorizontalGap(),
                        Text(
                          info.phoneType ?? '',
                          style: context.theme.textTheme.bodyRegular_14.copyWith(
                            color: context.theme.colorScheme.naturalColor0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
