class RoutesNames {
  static String get appInit => '/';
  static String get connectionError => '/connection-error';
  static final ShareRoutes share = ShareRoutes();
  static final SettingsRoutes settings = SettingsRoutes();
}

class ShareRoutes {
  String baseShare = '/share';
  String get sharedUserDetails => '$baseShare/:id';
}

class SettingsRoutes {
  String baseSettings = '/settings';
  String get privacyPolicy => '/privacy-policy';
  String get support => '/support';
}
