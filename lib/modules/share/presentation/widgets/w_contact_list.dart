import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:fastap/modules/share/presentation/widgets/w_info_dialog.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class WContactList extends StatelessWidget {
  const WContactList({
    super.key,
    required this.contactInfoList,
  });
  final List<MContactInfo> contactInfoList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: contactInfoList
          .map<Widget>(
            (info) => Container(
              height: 40,
              width: 350,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primaryColor300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () async {
                  if (info.storeLinkType == StoreLinkType.Fax) {
                    showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (context) {
                        return WInfoDialog(
                          contactInfo: info,
                        );
                      },
                    );
                  } else {
                    await Modular.get<ShareCubit>().onContactInfoTap(info);
                  }
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      info.icon ?? '',
                      width: 20,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 185,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                info.mainValue?.split(Constants.common.separator).first ?? '',
                                style: context.theme.textTheme.bodyRegular_14.copyWith(
                                  color: context.theme.colorScheme.naturalColor0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
