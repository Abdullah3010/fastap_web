import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/utils/enums.dart';

class MContactList {
  MContactList({
    this.docName,
    this.info,
  });

  factory MContactList.fromJson(String? key, Map<String, dynamic>? json) {
    return MContactList(
      docName: key ?? '',
      info: MContactInfo.fromJson(json),
    );
  }

  factory MContactList.fromMContactList(MContactList contactList) {
    return MContactList(
      docName: contactList.docName ?? '',
      info: contactList.info,
    );
  }
  final String? docName;
  final MContactInfo? info;
}

class MContactInfo {
  final String? id;
  final String? name;
  final String? exampleLink;
  final String? description;
  final String? icon;
  List<String>? values;
  String? mainValue;
  String? mainWebsiteNameValue;
  final StoreLinkType? storeLinkType;
  final StoreLinkCategory? storeLinkCategory;
  String? phoneType;
  String? locationType;
  List<String>? websiteName;
  bool isActive;

  MContactInfo({
    this.id,
    this.storeLinkType,
    this.storeLinkCategory,
    this.name,
    this.exampleLink,
    this.description,
    this.icon,
    this.values,
    this.mainValue,
    this.mainWebsiteNameValue,
    this.phoneType,
    this.locationType,
    this.websiteName,
    this.isActive = false,
  });

  factory MContactInfo.fromJson(Map<String, dynamic>? json) {
    final StoreLinkCategory? getStoreLinkCategory = switch (json?['storeLinkCategory'] ?? '') {
      'ContactInfo' => StoreLinkCategory.ContactInfo,
      'SocialMedia' => StoreLinkCategory.SocialMedia,
      _ => null,
    };

    final StoreLinkType? getStoreLinkType = switch (json?['storeLinkType'] ?? '') {
      'LinkedIn' => StoreLinkType.LinkedIn,
      'Youtube' => StoreLinkType.Youtube,
      'Facebook' => StoreLinkType.Facebook,
      'Instagram' => StoreLinkType.Instagram,
      'Twitter' => StoreLinkType.Twitter,
      'Behance' => StoreLinkType.Behance,
      'SnapChat' => StoreLinkType.SnapChat,
      'TikTok' => StoreLinkType.TikTok,
      'Tripadvisor' => StoreLinkType.Tripadvisor,
      'Phone' => StoreLinkType.Phone,
      'Whatsapp' => StoreLinkType.Whatsapp,
      'Email' => StoreLinkType.Email,
      'Location' => StoreLinkType.Location,
      'Website' => StoreLinkType.Website,
      'Fax' => StoreLinkType.Fax,
      _ => null,
    };

    return MContactInfo(
      id: json?['id'] ?? '',
      name: json?['name'] ?? '',
      values: json?['value'] != null ? List<String>.from(json?['value']) : null,
      storeLinkCategory: getStoreLinkCategory,
      storeLinkType: getStoreLinkType,
      icon: json?['icon'] ?? '',
      phoneType: json?['phoneType'] ?? '',
      locationType: json?['locationType'] ?? '',
      isActive: json?['isActive'] ?? false,
      websiteName: json?['websiteName'] != null ? List<String>.from(json?['websiteName']) : null,
    );
  }

  factory MContactInfo.fromMContactInfo(MContactInfo json) {
    bool isActive = false;
    if (Constants.common.multipleValues.contains(json.storeLinkType)) {
      isActive = json.mainValue?.split(Constants.common.separator).last == 'A';
    } else {
      isActive = json.isActive;
    }
    return MContactInfo(
      id: json.id ?? '',
      name: json.name ?? '',
      mainValue: json.mainValue ?? '',
      mainWebsiteNameValue: json.mainWebsiteNameValue ?? '',
      storeLinkCategory: json.storeLinkCategory,
      storeLinkType: json.storeLinkType,
      icon: json.icon ?? '',
      phoneType: json.phoneType ?? '',
      locationType: json.locationType ?? '',
      isActive: isActive,
      websiteName: json.websiteName,
    );
  }

  Map<String, dynamic> toJson(String docName) {
    return {
      docName: {
        'name': name ?? '',
        'value': values ?? [],
        'storeLinkCategory': storeLinkCategory?.name,
        'storeLinkType': storeLinkType?.name,
        'icon': icon,
        'phoneType': phoneType ?? '',
        'locationType': locationType ?? '',
        'isActive': isActive,
        'websiteName': websiteName ?? [],
      }
    };
  }

  StoreLinkCategory getStoreLinkCategory(String? name) {
    return switch (name) {
      'ContactInfo' => StoreLinkCategory.ContactInfo,
      'SocialMedia' => StoreLinkCategory.SocialMedia,
      _ => StoreLinkCategory.ContactInfo,
    };
  }
}
