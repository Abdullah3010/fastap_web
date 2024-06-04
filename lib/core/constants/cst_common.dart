import 'package:fastap/core/utils/enums.dart';
import 'package:flutter/material.dart';

class CSTCommonValues {
  final List<int> successStatusCodes = [200, 201, 204];

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final String appDomain = 'https://www.fastap.net/';

  ProfileNumber activeProfile = ProfileNumber.One;

  List<StoreLinkType> multipleValues = [
    StoreLinkType.Behance,
    StoreLinkType.Email,
    StoreLinkType.Facebook,
    StoreLinkType.Fax,
    StoreLinkType.Instagram,
    StoreLinkType.LinkedIn,
    StoreLinkType.Phone,
    StoreLinkType.Location,
    StoreLinkType.Youtube,
    StoreLinkType.SnapChat,
    StoreLinkType.TikTok,
    StoreLinkType.Tripadvisor,
    StoreLinkType.Whatsapp,
    StoreLinkType.Website,
    StoreLinkType.Twitter,
  ];

  String separator = '<<>>>';
}
