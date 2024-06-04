import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/core/widgets/w_app_button.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WProfileSelection extends StatelessWidget {
  const WProfileSelection({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WAppButton(
          width: context.width < 600 ? 95 : 150,
          title: 'Profile 1',
          isFilled: Constants.common.activeProfile == ProfileNumber.One,
          onTap: Constants.common.activeProfile == ProfileNumber.One
              ? null
              : () {
                  Modular.get<ShareCubit>().changeProfileNumber(ProfileNumber.One, uid);
                },
        ),
        16.createHorizontalGap(),
        WAppButton(
          width: context.width < 600 ? 95.w : 150.w,
          title: 'Profile 2',
          isFilled: Constants.common.activeProfile == ProfileNumber.Two,
          onTap: Constants.common.activeProfile == ProfileNumber.Two
              ? null
              : () {
                  Modular.get<ShareCubit>().changeProfileNumber(ProfileNumber.Two, uid);
                },
        )
      ],
    );
  }
}
