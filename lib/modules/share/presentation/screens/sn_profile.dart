import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/int_extension.dart';
import 'package:fastap/core/widgets/sn_undefined_route.dart';
import 'package:fastap/core/widgets/w_app_button.dart';
import 'package:fastap/core/widgets/w_app_loader.dart';
import 'package:fastap/core/widgets/w_shared_scaffold.dart';
import 'package:fastap/modules/share/presentation/widgets/w_contact_list.dart';
import 'package:fastap/modules/share/presentation/widgets/w_link_store_container.dart';
import 'package:fastap/modules/share/presentation/widgets/w_profile_selection.dart';
import 'package:fastap/modules/share/presentation/widgets/w_profile_top_section.dart';
import 'package:fastap/modules/share/presentation/widgets/w_social_media_container.dart';
import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SNProfile extends StatefulWidget {
  const SNProfile({
    super.key,
    this.userUid,
  });
  final String? userUid;

  @override
  State<SNProfile> createState() => _SNProfileState();
}

class _SNProfileState extends State<SNProfile> {
  final ShareCubit cubit = Modular.get<ShareCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getProfile(widget.userUid ?? '', Constants.common.activeProfile.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<ShareCubit, ProfileState>(
        bloc: cubit,
        builder: (context, state) {
          return state is GetProfileError
              ? const SNUndefinedRoute()
              : WSharedScaffold(
                  paddingBottom: 0,
                  paddingLeft: 0,
                  paddingRight: 0,
                  paddingTop: 0,
                  isLoading: state is ProfileLoading,
                  body: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: 600.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 22.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            width: 5.w,
                            color: context.theme.colorScheme.primaryColor300,
                          ),
                        ),
                        child: Column(
                          children: [
                            WProfileTopSection(),
                            22.createVerticalGap(),
                            WProfileSelection(uid: widget.userUid ?? ''),
                            24.createVerticalGap(),
                            WAppButton(
                              title: 'Save contact',
                              onTap: () async {
                                cubit.saveContactInfo(widget.userUid ?? '');
                              },
                            ),
                            if (state is ProfileLoading)
                              const WAppLoader()
                            else ...[
                              24.createVerticalGap(),
                              WSocialMediaContainer(
                                contactInfoList: cubit.socialMediaList,
                              ),
                              24.createVerticalGap(),
                              WLinkStoreContainer(
                                contactInfoList: cubit.contactsInfoList,
                                phons: cubit.phones,
                              ),
                              30.createVerticalGap(),
                              WContactList(
                                contactInfoList: cubit.contactsInfoList,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    //      Column(
                    //   children: [

                    //     // 30.createVerticalGap(),
                    //     // const WFooter(),
                    //   ],
                    // ),
                  ),
                );
        },
      ),
    );
  }
}
