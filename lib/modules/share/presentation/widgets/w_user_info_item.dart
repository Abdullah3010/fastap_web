import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WUserInfoItem extends StatefulWidget {
  const WUserInfoItem({
    super.key,
    required this.contactInfo,
  });
  final MContactInfo? contactInfo;

  @override
  State<WUserInfoItem> createState() => _WUserInfoItemState();
}

class _WUserInfoItemState extends State<WUserInfoItem> {
  // bool isSwitched = true;
  final textEditingController = TextEditingController();
  String contactName = '';
  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.contactInfo?.mainValue ?? '';
    if (widget.contactInfo?.storeLinkType == StoreLinkType.Phone) {
      contactName = '${widget.contactInfo?.name} (${widget.contactInfo?.phoneType})';
    } else if (widget.contactInfo?.storeLinkType == StoreLinkType.Location) {
      contactName = '${widget.contactInfo?.name} (${widget.contactInfo?.locationType})';
    } else {
      contactName = widget.contactInfo?.name ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: 16.w,
        vertical: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: 40.w,
            child: SvgPicture.asset(
              widget.contactInfo?.icon ?? '',
            ),
          ),
          16.createVerticalGap(),
          SizedBox(
            width: 300.w,
            child: Text(
              contactName,
              style: context.theme.textTheme.bodyRegular_14.copyWith(
                color: context.theme.colorScheme.naturalColor0,
                fontSize: 12.sp,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
