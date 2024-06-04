import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/widgets/w_shared_network_image.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WProfileTopSection extends StatelessWidget {
  WProfileTopSection({super.key});

  final ShareCubit cubit = Modular.get<ShareCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 210.h,
          child: Stack(
            children: [
              /// [Cover image]
              Container(
                width: double.infinity,
                height: 170.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14.r),
                    bottomRight: Radius.circular(14.r),
                  ),
                ),
                child: Center(
                  child: WSharedNetworkImage(
                    imageUrl: cubit.currentUser.coverPicture ?? '',
                    height: 170.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    withBackground: false,
                    isProfiel: true,
                  ),
                ),
              ),

              /// [Profile image]
              Positioned(
                bottom: 0,
                left: 12.w,
                child: CircleAvatar(
                  backgroundColor: context.theme.colorScheme.naturalColor0,
                  radius: 64.r,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipOval(
                      child: WSharedNetworkImage(
                        imageUrl: cubit.currentUser.profilePicture ?? '',
                        height: 128.h,
                        width: 128.h,
                        fit: BoxFit.cover,
                        withBackground: false,
                        isProfiel: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (cubit.currentUser.fullName != null && cubit.currentUser.fullName!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              cubit.currentUser.fullName ?? '',
              style: context.theme.textTheme.titleMedium_28.copyWith(
                color: context.theme.colorScheme.naturalColor0,
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        if (cubit.currentUser.companyName != null && cubit.currentUser.companyName!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              cubit.currentUser.companyName ?? '',
              style: context.theme.textTheme.bodyMedium_14.copyWith(
                color: context.theme.colorScheme.naturalColor0,
              ),
            ),
          ),
        if (cubit.currentUser.title != null && cubit.currentUser.title!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              cubit.currentUser.title ?? '',
              style: context.theme.textTheme.bodyMedium_14.copyWith(
                color: context.theme.colorScheme.naturalColor0,
              ),
            ),
          ),
        16.createVerticalGap(),
      ],
    );
  }
}
