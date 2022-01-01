// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

import '../../features/notr/presentation/pages/app_init.dart' as _i1;
import '../../features/notr/presentation/pages/buddies_page.dart' as _i8;
import '../../features/notr/presentation/pages/discover_page.dart' as _i9;
import '../../features/notr/presentation/pages/home_page.dart' as _i6;
import '../../features/notr/presentation/pages/login_page.dart' as _i2;
import '../../features/notr/presentation/pages/profile_page.dart' as _i7;
import '../../features/notr/presentation/pages/registration_page.dart' as _i3;
import '../../features/notr/presentation/pages/reset_password_page.dart' as _i4;
import '../../features/notr/presentation/pages/settings_page.dart' as _i10;
import '../../features/notr/presentation/pages/verify_page.dart' as _i5;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppInit.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.AppInit(),
          transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.RegistrationPage(key: args.key),
          transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    ResetPasswordRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ResetPasswordPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    VerifyRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.VerifyPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideLeftWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.HomePage(key: args.key),
          transitionsBuilder: _i11.TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfilePage(),
          opaque: true,
          barrierDismissible: false);
    },
    BuddiesRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.BuddiesPage(),
          opaque: true,
          barrierDismissible: false);
    },
    DiscoverRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.DiscoverPage(),
          opaque: true,
          barrierDismissible: false);
    },
    SettingsRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.SettingsPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(AppInit.name, path: '/'),
        _i11.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i11.RouteConfig(RegistrationRoute.name, path: '/registration-page'),
        _i11.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i11.RouteConfig(VerifyRoute.name, path: '/verify-page'),
        _i11.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i11.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name),
          _i11.RouteConfig(BuddiesRoute.name,
              path: 'buddies-page', parent: HomeRoute.name),
          _i11.RouteConfig(DiscoverRoute.name,
              path: 'discover-page', parent: HomeRoute.name),
          _i11.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.AppInit]
class AppInit extends _i11.PageRouteInfo<void> {
  const AppInit() : super(AppInit.name, path: '/');

  static const String name = 'AppInit';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationRoute extends _i11.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i13.Key? key})
      : super(RegistrationRoute.name,
            path: '/registration-page', args: RegistrationRouteArgs(key: key));

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ResetPasswordPage]
class ResetPasswordRoute extends _i11.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i5.VerifyPage]
class VerifyRoute extends _i11.PageRouteInfo<void> {
  const VerifyRoute() : super(VerifyRoute.name, path: '/verify-page');

  static const String name = 'VerifyRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i13.Key? key, List<_i11.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.BuddiesPage]
class BuddiesRoute extends _i11.PageRouteInfo<void> {
  const BuddiesRoute() : super(BuddiesRoute.name, path: 'buddies-page');

  static const String name = 'BuddiesRoute';
}

/// generated route for
/// [_i9.DiscoverPage]
class DiscoverRoute extends _i11.PageRouteInfo<void> {
  const DiscoverRoute() : super(DiscoverRoute.name, path: 'discover-page');

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}
