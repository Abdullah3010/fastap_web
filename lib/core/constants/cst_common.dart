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

  String privacyPolicyContent = '''
Privacy Policy
FasTap Company built the FasTap app as a Free app. This SERVICE is provided by FasTap at no cost and is intended for use as is.

This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.

If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at FasTap unless otherwise defined in this Privacy Policy.

Information Collection and Use

For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.

Security

We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

Links to Other Sites

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children’s Privacy

These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.

Changes to This Privacy Policy

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.

Contact Us

If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at +974 6000 1625 is the app owner.
''';
}
