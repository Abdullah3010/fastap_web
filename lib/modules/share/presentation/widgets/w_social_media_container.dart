import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WSocialMediaContainer extends StatelessWidget {
  WSocialMediaContainer({
    super.key,
    required this.contactInfoList,
  });

  final List<MContactInfo> contactInfoList;

  final TextEditingController textEditingController = TextEditingController();

  final ShareCubit cubit = Modular.get<ShareCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 22.w,
        left: 22.w,
        top: 20.h,
        bottom: 20.h,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: contactInfoList
            .map(
              (info) => InkWell(
                onTap: () {
                  cubit.onContactInfoTap(info);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  height: 45,
                  width: 45,
                  child: Center(
                    child: SvgPicture.asset(
                      info.icon ?? '',
                      width: 35,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
