import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class WFooter extends StatelessWidget {
  const WFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      width: double.infinity,
      color: context.theme.colorScheme.primaryColor700,
      padding: const EdgeInsets.all(20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10.w,
        runSpacing: 10.h,
        children: <Widget>[
          SizedBox(
            width: 500.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'FasTap simplifies networking with our innovative NFC card technology. Share your contact details instantly and effortlessly.',
                  style: context.theme.textTheme.bodyMedium_14.copyWith(
                    color: context.theme.colorScheme.naturalColor20,
                  ),
                ),
                5.createVerticalGap(),
                Text(
                  'For support or inquiries, please email us at:',
                  style: context.theme.textTheme.bodyMedium_14.copyWith(
                    color: context.theme.colorScheme.naturalColor20,
                  ),
                ),
                5.createVerticalGap(),
                InkWell(
                  onTap: () => _launchMail('support@fastap.com'),
                  child: Text(
                    'support@fastap.com',
                    style: context.theme.textTheme.bodyMedium_14.copyWith(
                      color: context.theme.colorScheme.primaryColor300,
                      decoration: TextDecoration.underline,
                      decorationColor: context.theme.colorScheme.primaryColor300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 500.w,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 10.w,
              runSpacing: 10.h,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 200.w,
                    child: GestureDetector(
                      onTap: () => _launchURL('https://apps.apple.com/app/idYOUR_APPLE_APP_ID'),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.iosBadge.path,
                          width: 160.w,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Center(
                  child: SizedBox(
                    width: 200.w,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => _launchURL('https://play.google.com/store/apps/details?id=YOUR_PACKAGE_NAME'),
                        child: Center(
                          child: Image.asset(
                            Assets.icons.googlePlayBadge.path,
                            width: 200.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  void _launchMail(String email) async {
    final mailUrl = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(mailUrl)) {
      throw 'Could not launch $email';
    }
  }
}
