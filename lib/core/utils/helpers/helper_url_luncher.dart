import 'package:fastap/core/utils/helpers/app_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperUrlLauncher {
  static Future<void> launch(String url) async {
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication,
        webOnlyWindowName: '_blank',
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      )) {
        if (!url.contains('mailto:')) {
          AppAlert.error('Could not launch Url');
        }
      }
    } catch (e) {
      AppAlert.error('Could not launch Url');
    }
  }

  static Future<void> launchDialer(String phoneNumber) async {
    String urlScheme = 'tel:$phoneNumber';
    final Uri launchUri = Uri.parse(urlScheme);
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        AppAlert.error('Could not launch dialer');
      }
    } catch (e) {
      AppAlert.error('Could not launch dialer');
    }
  }
}
