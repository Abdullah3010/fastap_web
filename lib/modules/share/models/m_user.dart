import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/utils/enums.dart';
import 'package:fastap/modules/share/models/m_contact_info.dart';

class MUser {
  String? uid;
  String? fullName;
  final String? email;
  String? profilePicture;
  String? coverPicture;
  String? companyName;
  String? title;
  List<MContactList>? contactsInfoList;

  MUser({
    this.uid,
    this.fullName,
    this.email,
    this.companyName,
    this.title,
    this.profilePicture,
    this.coverPicture,
    this.contactsInfoList,
  });

  factory MUser.fromJson(Map<String, dynamic> json) => MUser(
        fullName: json['fullName'],
        email: json['email'],
        companyName: json['companyName'],
        title: json['title'],
        profilePicture: json['profilePicture'],
        coverPicture: json['coverPicture'],
      );

  Map<String, dynamic> toJson() => {
        'fullName': fullName ?? '',
        'email': email ?? '',
        'companyName': companyName ?? '',
        'title': title ?? '',
        'profilePicture': profilePicture ?? '',
        'coverPicture': coverPicture ?? '',
      };

  String toVCard() {
    try {
      String str = "";
      str += "BEGIN:VCARD\n";
      str += "VERSION:3.0\n";

      /// --------------------- [fullName] ---------------------
      str += addFullName();

      /// --------------------- [title] ---------------------
      str += addTitleAndCompany();

      /// --------------------- [Phone] ---------------------
      str += addPhoneNumber();

      /// --------------------- [Address] ---------------------
      str += addAdresses();

      /// --------------------- [Social Media] ---------------------
      str += addSocialMediaLinks();

      /// --------------------- [Whatsapp] ---------------------
      str += addWhatsapp();

      /// --------------------- [Fax] ---------------------
      str += addFax();

      /// --------------------- [Email] ---------------------
      str += addEmails();

      /// --------------------- [Website] ---------------------
      str += addWebsites();

      /// --------------------- [Profile Picture] ---------------------
      str += addProfilePicture();
      str += "END:VCARD";
      print("=======>>>>>> $str");
      return str;
    } catch (e) {
      print(" ===>><<<< $e");
      return '';
    }
  }

  String addProfilePicture() {
    try {
      String str = "";
      if (profilePicture != null && (profilePicture?.isNotEmpty ?? false)) {
        str += "PHOTO;TYPE=JPEG;VALUE=URI:$profilePicture\n";
      }
      return str;
    } catch (e) {
      print(" ===>><<<<1111 $e");
      return '';
    }
  }

  String addWebsites() {
    try {
      String str = "";
      MContactList? website =
          contactsInfoList?.firstWhere((element) => element.info?.storeLinkType == StoreLinkType.Website);

      for (int i = 0; i < (website?.info?.values?.length ?? 0); i++) {
        if (website != null && (website.info?.mainValue?.isNotEmpty ?? false)) {
          //URL;type=TikTok:http://www.tiktok.com/@johndoe
          if (isActive(website.info?.values?[i] ?? '')) {
            str +=
                "URL;type=${website.info?.websiteName?[i]}:https://${website.info?.values?[i].split(Constants.common.separator).first}\n";
          }
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<22222 $e");
      return '';
    }
  }

  String addEmails() {
    try {
      String str = "";
      // if (email != null && (email?.isNotEmpty ?? false)) {
      //   str += "EMAIL:$email\n";
      // }
      MContactList? emails = (contactsInfoList ?? [])
          .firstWhere((element) => element.info?.storeLinkType == StoreLinkType.Email, orElse: () => MContactList());
      for (String value in emails.info?.values ?? []) {
        if (isActive(value)) {
          str += "EMAIL:${value.split(Constants.common.separator).first}\n";
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<3333 $e");
      return '';
    }
  }

  String addFax() {
    try {
      String str = "";
      MContactList? fax = (contactsInfoList ?? [])
          .firstWhere((element) => element.info?.storeLinkType == StoreLinkType.Fax, orElse: () => MContactList());

      for (String value in fax.info?.values ?? []) {
        //TEL;TYPE=fax,voice;VALUE=uri:+1112223333
        if (isActive(value)) {
          str += "TEL;TYPE=fax,voice;VALUE=uri:${value.split(Constants.common.separator).first}\n";
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<4444 $e");
      return '';
    }
  }

  String addWhatsapp() {
    try {
      String str = "";
      List<MContactList> allWhatsappList = contactsInfoList
              ?.where((element) =>
                  element.info?.storeLinkType == StoreLinkType.Whatsapp && (element.info?.isActive ?? false))
              .toList() ??
          [];

      for (MContactList whatsapp in allWhatsappList) {
        //URL;type=TikTok:http://www.tiktok.com/@johndoe
        for (String value in (whatsapp.info?.values ?? [])) {
          if (isActive(value)) {
            str += "URL;type=whatsapp:http://wa.me/${value.split(Constants.common.separator).first}\n";
          }
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<5555 $e");
      return '';
    }
  }

  String addSocialMediaLinks() {
    try {
      String str = "";
      List<MContactList> allLinks = contactsInfoList
              ?.where((element) =>
                  element.info?.storeLinkCategory == StoreLinkCategory.SocialMedia && (element.info?.isActive ?? false))
              .toList() ??
          [];

      for (MContactList link in allLinks) {
        //URL;type=TikTok:http://www.tiktok.com/@johndoe
        for (String value in (link.info?.values ?? [])) {
          if (isActive(value)) {
            str += "URL;type=${link.info?.storeLinkType?.name}:${value.split(Constants.common.separator).first}\n";
          }
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<5555 $e");
      return '';
    }
  }

  String addAdresses() {
    try {
      String str = "";
      List<MContactList> adresses = contactsInfoList
              ?.where((element) =>
                  element.info?.storeLinkType == StoreLinkType.Location && (element.info?.isActive ?? false))
              .toList() ??
          [];
      for (MContactList adresses in adresses) {
        //ADR;TYPE=HOME:;;123 Main Street;Springfield;IL;62701;USA
        for (String value in (adresses.info?.values ?? [])) {
          final String mainAdress = value.split(Constants.common.separator).first.replaceAll(',', ';');
          if (isActive(value)) {
            str += "ADR;TYPE=${adresses.info?.locationType?.toLowerCase()}:;$mainAdress\n";
          }
        }
      }
      return str;
    } catch (e) {
      return '';
    }
  }

  String addPhoneNumber() {
    try {
      String str = "";
      List<MContactList> phons = contactsInfoList
              ?.where(
                  (element) => element.info?.storeLinkType == StoreLinkType.Phone && (element.info?.isActive ?? false))
              .toList() ??
          [];
      for (MContactList phone in phons) {
        for (String value in (phone.info?.values ?? [])) {
          if (isActive(value)) {
            str +=
                "TEL;TYPE=${phone.info?.phoneType?.toLowerCase()};VALUE=uri:${value.split(Constants.common.separator).first}\n";
          }
        }
      }
      return str;
    } catch (e) {
      print(" ===>><<<<7777 $e");
      return '';
    }
  }

  String addTitleAndCompany() {
    String str = "";
    if (title != null && (title?.isNotEmpty ?? false)) {
      str += "TITLE:$title";
      if (companyName != null && (companyName?.isNotEmpty ?? false)) {
        str += " at ($companyName)";
      }
      str += "\n";
    }
    return str;
  }

  String addFullName() {
    String str = "FN:${fullName ?? ''}\n";
    return str;
  }

  bool isActive(String value) {
    return value.split(Constants.common.separator).last == 'A';
  }
}
