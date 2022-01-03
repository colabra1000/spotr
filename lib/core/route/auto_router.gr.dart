// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../app_init.dart' as _i1;
import '../../features/authentication/presentation/pages/login_page.dart'
    as _i2;
import '../../features/authentication/presentation/pages/registration_page.dart'
    as _i3;
import '../../features/authentication/presentation/pages/reset_password_page.dart'
    as _i4;
import '../../features/authentication/presentation/pages/verify_page.dart'
    as _i5;
import '../../features/main_app/presentation/pages/buddies_page.dart' as _i8;
import '../../features/main_app/presentation/pages/discover_page.dart' as _i9;
import '../../features/main_app/presentation/pages/home_page.dart' as _i6;
import '../../features/main_app/presentation/pages/main_settings_page.dart'
    as _i11;
import '../../features/main_app/presentation/pages/profile_page.dart' as _i7;
import '../../features/main_app/presentation/pages/settings_page.dart' as _i10;
import '../../features/main_app/presentation/pages/sub_settings_page.dart'
    as _i12;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AppInit.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.AppInit(),
          transitionsBuilder: _i13.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i13.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.RegistrationPage(key: args.key),
          transitionsBuilder: _i13.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    ResetPasswordRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ResetPasswordPage(),
          transitionsBuilder: _i13.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    VerifyRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.VerifyPage(),
          transitionsBuilder: _i13.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.HomePage(key: args.key),
          transitionsBuilder: _i13.TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfilePage(),
          opaque: true,
          barrierDismissible: false);
    },
    BuddiesRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.BuddiesPage(),
          opaque: true,
          barrierDismissible: false);
    },
    DiscoverRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.DiscoverPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SettingsRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.SettingsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    MainSettingsRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i11.MainSettingsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SubSettingsRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i12.SubSettingsPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(AppInit.name, path: '/'),
        _i13.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i13.RouteConfig(RegistrationRoute.name, path: '/registration-page'),
        _i13.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i13.RouteConfig(VerifyRoute.name, path: '/verify-page'),
        _i13.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i13.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name),
          _i13.RouteConfig(BuddiesRoute.name,
              path: 'buddies-page', parent: HomeRoute.name),
          _i13.RouteConfig(DiscoverRoute.name,
              path: 'discover-page', parent: HomeRoute.name),
          _i13.RouteConfig(SettingsRoute.name,
              path: 'settings-page',
              parent: HomeRoute.name,
              children: [
                _i13.RouteConfig(MainSettingsRoute.name,
                    path: 'main-settings-page', parent: SettingsRoute.name),
                _i13.RouteConfig(SubSettingsRoute.name,
                    path: 'sub-settings-page', parent: SettingsRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.AppInit]
class AppInit extends _i13.PageRouteInfo<void> {
  const AppInit() : super(AppInit.name, path: '/');

  static const String name = 'AppInit';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i13.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i14.Key? key})
      : super(RegistrationRoute.name,
            path: '/registration-page', args: RegistrationRouteArgs(key: key));

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ResetPasswordPage]
class ResetPasswordRoute extends _i13.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i5.VerifyPage]
class VerifyRoute extends _i13.PageRouteInfo<void> {
  const VerifyRoute() : super(VerifyRoute.name, path: '/verify-page');

  static const String name = 'VerifyRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i13.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i14.Key? key, List<_i13.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.BuddiesPage]
class BuddiesRoute extends _i13.PageRouteInfo<void> {
  const BuddiesRoute() : super(BuddiesRoute.name, path: 'buddies-page');

  static const String name = 'BuddiesRoute';
}

/// generated route for
/// [_i9.DiscoverPage]
class DiscoverRoute extends _i13.PageRouteInfo<void> {
  const DiscoverRoute() : super(DiscoverRoute.name, path: 'discover-page');

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
      : super(SettingsRoute.name,
            path: 'settings-page', initialChildren: children);

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.MainSettingsPage]
class MainSettingsRoute extends _i13.PageRouteInfo<void> {
  const MainSettingsRoute()
      : super(MainSettingsRoute.name, path: 'main-settings-page');

  static const String name = 'MainSettingsRoute';
}

/// generated route for
/// [_i12.SubSettingsPage]
class SubSettingsRoute extends _i13.PageRouteInfo<void> {
  const SubSettingsRoute()
      : super(SubSettingsRoute.name, path: 'sub-settings-page');

  static const String name = 'SubSettingsRoute';
}
