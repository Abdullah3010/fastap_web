import 'dart:html' as html;

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/core/utils/helpers/helper_url_luncher.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';
import 'package:fastap/modules/share/models/m_user.dart';
import 'package:flutter/material.dart';

part 'share_state.dart';

class ShareCubit extends Cubit<ProfileState> {
  ShareCubit() : super(ProfileInitial());

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  MUser currentUser = MUser();
  List<MContactInfo> contactsInfoList = [];
  List<MContactInfo> socialMediaList = [];
  List<MContactInfo> phones = [];

  Future<void> getProfile(String uid, String profileNumber) async {
    emit(ProfileLoading());
    try {
      /// [Get Main collections]
      DocumentSnapshot<Map<String, dynamic>> userDataDoc =
          await _firebaseFirestore.collection('users').doc(uid).collection('user_data').doc(profileNumber).get();
      DocumentSnapshot<Map<String, dynamic>> contactsInfoDoc =
          await _firebaseFirestore.collection('users').doc(uid).collection('contacts_info').doc(profileNumber).get();

      if ((userDataDoc.data()?.isEmpty ?? true) && (contactsInfoDoc.data()?.isEmpty ?? true)) {
        emit(GetProfileError());
        return;
      }
      MUser newUser = MUser.fromJson(userDataDoc.data() ?? {});
      List<MContactList> contactsInfoList = [];
      (contactsInfoDoc.data() ?? {}).forEach((key, value) {
        contactsInfoList.add(MContactList.fromJson(key, value));
      });
      filterContactsInfo(contactsInfoList);
      newUser.contactsInfoList = contactsInfoList;
      currentUser = newUser;
      emit(GetProfileSuccess());
    } catch (e) {
      emit(GetProfileError());
    }
  }

  void filterContactsInfo(List<MContactList> list) {
    List<MContactInfo> newList = [];

    for (MContactList e in list) {
      if (Constants.common.multipleValues.contains(e.info?.storeLinkType)) {
        List<String> values = e.info?.values ?? [];
        for (int i = 0; i < values.length; i++) {
          if (e.info?.storeLinkType == StoreLinkType.Website) {
            newList.add(MContactInfo.fromMContactInfo((e.info
                  ?..mainWebsiteNameValue = e.info?.websiteName?[i]
                  ..mainValue = values[i]) ??
                MContactInfo()));
          } else {
            newList.add(MContactInfo.fromMContactInfo((e.info?..mainValue = values[i]) ?? MContactInfo()));
          }
        }
      } else {
        newList.add(MContactInfo.fromMContactInfo((e.info?..mainValue = e.info?.values?.first) ?? MContactInfo()));
      }
    }

    contactsInfoList = newList
        .where((element) =>
            (element.storeLinkCategory == StoreLinkCategory.ContactInfo && (element.isActive)) &&
            (element.storeLinkType != StoreLinkType.Phone))
        .toList();

    phones = newList
        .where((element) =>
            (element.storeLinkCategory == StoreLinkCategory.ContactInfo && (element.isActive)) &&
            (element.storeLinkType == StoreLinkType.Phone))
        .toList();

    phones.sort((a, b) => (a.mainValue ?? '').compareTo(b.mainValue ?? ''));

    contactsInfoList.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));

    socialMediaList = newList
        .where((element) => element.storeLinkCategory == StoreLinkCategory.SocialMedia && (element.isActive))
        .toList();
    socialMediaList.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
  }

  Future<void> onContactInfoTap(MContactInfo contactInfoList) async {
    if (contactInfoList.storeLinkType == StoreLinkType.Whatsapp) {
      await HelperUrlLauncher.launch(
          'https://wa.me/${contactInfoList.mainValue?.split(Constants.common.separator).first}');
    } else if (contactInfoList.storeLinkType == StoreLinkType.Phone) {
      await HelperUrlLauncher.launchDialer('${contactInfoList.mainValue?.split(Constants.common.separator).first}');
    } else if (contactInfoList.storeLinkType == StoreLinkType.Email) {
      await HelperUrlLauncher.launch('mailto:${contactInfoList.mainValue?.split(Constants.common.separator).first}');
    } else if (contactInfoList.storeLinkType == StoreLinkType.Website) {
      if (contactInfoList.mainValue?.split(Constants.common.separator).first.startsWith('http') ?? false) {
        await HelperUrlLauncher.launch('${contactInfoList.mainValue?.split(Constants.common.separator).first}');
      } else {
        await HelperUrlLauncher.launch('https://${contactInfoList.mainValue?.split(Constants.common.separator).first}');
      }
    } else if (contactInfoList.storeLinkType == StoreLinkType.Location) {
      await HelperUrlLauncher.launch(
          'https://www.google.com/maps/search/${contactInfoList.mainValue?.split(Constants.common.separator).first.replaceAll(' ', '+')}');
    } else if (contactInfoList.storeLinkCategory == StoreLinkCategory.SocialMedia) {
      await HelperUrlLauncher.launch(contactInfoList.mainValue?.split(Constants.common.separator).first ?? '');
    } else {
      await HelperUrlLauncher.launch(contactInfoList.mainValue ?? '');
    }
  }

  void saveContactInfo(String uid) async {
    try {
      // final storageRef = FirebaseStorage.instance.ref();

      // final String downloadUrl = await storageRef.child('$uid/ProfilePicture').getDownloadURL();
      // print("Image in Base64: $downloadUrl");
      // final response = await Dio().get(
      //   downloadUrl,
      //   options: Options(
      //     responseType: ResponseType.bytes,
      //   ),
      // );

      // if (response.statusCode == 200) {
      //   // The image is successfully downloaded, you can use the bytes or convert it to a base64 string
      //   final Uint8List imageData = Uint8List.fromList(response.data);
      //   final base64Image = base64Encode(imageData);
      //   print("Image in Base64: $base64Image");
      //   AppAlert.success('Image Downloaded Successfully $base64Image');
      // } else {
      //   print("Failed to download image. Status code: ${response.statusCode}");
      // }

      String vCard = currentUser.toVCard();

      html.Blob blob = html.Blob([vCard], 'text/vcard');

      html.AnchorElement downloadLink = html.AnchorElement(href: html.Url.createObjectUrl(blob));
      downloadLink.download = '${uid}_${DateTime.now().millisecondsSinceEpoch}.vcf';

      downloadLink.click();
    } catch (e) {
      print(e);
    }
  }

  void changeProfileNumber(ProfileNumber profileNumber, String uid) async {
    Constants.common.activeProfile = profileNumber;
    await getProfile(uid, Constants.common.activeProfile.name);
  }
}
