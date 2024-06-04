class RoutesNames {
  static String get appInit => '/';
  static String get connectionError => '/connection-error';
  static final ShareRoutes share = ShareRoutes();
}

class ShareRoutes {
  String baseShare = '/share';
  String get sharedUserDetails => '$baseShare/:id';
}
