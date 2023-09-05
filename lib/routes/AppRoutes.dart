enum AppRoutes {
  root,
  login,
  home,
  listMosques,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/login",
    AppRoutes.home: "/home",
    AppRoutes.listMosques: "/listMosques",
  };

  String get toName => appRoutes[this]!;
}

enum ApiRoutes {
  login,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.login: "",
  };

  String get toName => apiRoutes[this]!;
}
