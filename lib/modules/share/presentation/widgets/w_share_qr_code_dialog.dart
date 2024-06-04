import 'package:fastap/core/assets/assets.gen.dart';
import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/widgets/w_shared_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WShareQrCodeDialog extends StatefulWidget {
  const WShareQrCodeDialog({
    super.key,
    this.uid,
  });

  final String? uid;

  @override
  State<WShareQrCodeDialog> createState() => _WShareQrCodeDialogState();
}

class _WShareQrCodeDialogState extends State<WShareQrCodeDialog> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = '${Constants.common.appDomain}share/${widget.uid}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Modular.to.pop();
              },
              child: Icon(
                Icons.close,
                color: context.theme.colorScheme.primaryColor300,
              ),
            ),
          ],
        ),
        Image.asset(
          Assets.icons.appLogoBlack.path,
        ),
        8.createVerticalGap(),
        Text(
          'Sharing',
          style: context.theme.textTheme.bodyMedium_14,
        ),
        14.createVerticalGap(),
        Center(
          child: QrImageView(
            data: '${Constants.common.appDomain}share/${widget.uid}',
            version: QrVersions.auto,
            size: 200.w,
            gapless: false,
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: context.theme.colorScheme.naturalColor700,
            ),
            dataModuleStyle: QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: context.theme.colorScheme.naturalColor700,
            ),
          ),
        ),
        14.createVerticalGap(),
        Text(
          'scan the code above to get information',
          style: context.theme.textTheme.bodyRegular_14.copyWith(
            color: context.theme.colorScheme.naturalColor200,
          ),
        ),
        14.createVerticalGap(),
        WSharedInput(
          textEditingController: controller,
          enabled: false,
          suffixIconWidget: InkWell(
            onTap: () async {
              await FlutterShare.share(
                title: 'Share your profile',
                linkUrl: controller.text,
              );
              // Clipboard.setData(ClipboardData(text: controller.text))
              //     .then((value) => AppAlert.success('Copied successfully'));
            },
            child: Icon(
              Icons.copy_rounded,
              color: context.theme.colorScheme.naturalColor200,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
