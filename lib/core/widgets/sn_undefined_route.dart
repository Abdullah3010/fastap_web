import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/widgets/w_shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SNUndefinedRoute extends StatelessWidget {
  const SNUndefinedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: Container(
        width: double.infinity,
        // height: double.infinity,
        color: context.theme.colorScheme.primaryColor300.withOpacity(0.3),
        child: Center(
          child: SvgPicture.asset(
            Assets.icons.error404.path,
            width: 500.w,
          ),
        ),
      ),
    );
  }
}
