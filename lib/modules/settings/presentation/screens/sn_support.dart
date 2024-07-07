import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/utils/helpers/app_alert.dart';
import 'package:fastap/core/widgets/w_shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SNSupport extends StatelessWidget {
  const SNSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            Image.asset(
              Assets.icons.appLogoPng.path,
              width: 236.w,
              height: 74.h,
            ),
            42.createVerticalGap(),
            SvgPicture.asset(
              Assets.icons.contactUs.path,
              width: 55.w,
              height: 55.h,
            ),
            42.createVerticalGap(),
            Text(
              "Hi, how can we help?",
              style: context.theme.textTheme.bodyMedium_16.copyWith(
                color: context.theme.colorScheme.primaryColor300,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            32.createVerticalGap(),
            SizedBox(
              width: 250.w,
              child: Text(
                "If you need any assistant, do not hesitate to contact our support team via email:",
                style: context.theme.textTheme.bodyMedium_14.copyWith(
                  color: context.theme.colorScheme.naturalColor40,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            16.createVerticalGap(),
            Text(
              "info@fastap.utr",
              style: context.theme.textTheme.bodyMedium_16.copyWith(
                color: context.theme.colorScheme.naturalColor0,
              ),
              textAlign: TextAlign.center,
            ),
            60.createVerticalGap(),
            Text(
              "Or via Whatsapp:",
              style: context.theme.textTheme.bodyMedium_14.copyWith(
                color: context.theme.colorScheme.naturalColor40,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
            16.createVerticalGap(),
            InkWell(
              onTap: () async {
                customLaunchUrl(
                  'https://wa.me/+97455491627',
                );
              },
              child: SvgPicture.asset(
                Assets.icons.whatsapp.path,
                width: 55.w,
                height: 55.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void customLaunchUrl(String uri) async {
    if ((uri.runtimeType == String && await canLaunchUrl(Uri.parse(uri)))) {
      dynamic response;
      response = await launchUrl(
        Uri.parse(uri),
        mode: LaunchMode.externalApplication,
      );
      if (response == false) {
        AppAlert.error("Whats App Doesn't Exist");
      }
    } else {
      AppAlert.error("Whats App Doesn't Exist");
    }
  }
}
