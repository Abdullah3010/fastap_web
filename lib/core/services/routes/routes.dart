import 'package:fastap/core/services/routes/routes_names.dart';
import 'package:fastap/core/widgets/sn_undefined_route.dart';
import 'package:fastap/modules/core/presentation/screens/sn_splash.dart';
import 'package:fastap/modules/settings/presentation/screens/sn_privacy_policy.dart';
import 'package:fastap/modules/settings/presentation/screens/sn_support.dart';
import 'package:fastap/modules/share/presentation/screens/sn_profile.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [Routes] is a class that contains all the routes in the app.
class Routes {
  /// [buildRoutes] is a function that build all the routes in the app.
  static void buildRoutes(RouteManager r) {
    r.child(
      RoutesNames.appInit,
      transition: TransitionType.fadeIn,
      child: (_) => const SNSplash(),
    );

    /// [ProfileRoutes] ----------------
    r.child(
      RoutesNames.share.sharedUserDetails,
      transition: TransitionType.fadeIn,
      child: (_) => SNProfile(
        userUid: r.args.params['id'] as String?,
      ),
    );
    r.child(
      RoutesNames.settings.privacyPolicy,
      transition: TransitionType.fadeIn,
      child: (_) => const SNPrivacyPolicy(),
    );
    r.child(
      RoutesNames.settings.support,
      transition: TransitionType.fadeIn,
      child: (_) => const SNSupport(),
    );

    /// [EndProfileRoutes] ----------------
    //------------- Undefined Route Screen -------------//
    r.wildcard(
      transition: TransitionType.fadeIn,
      child: (_) => const SNUndefinedRoute(),
    );
  }
}
