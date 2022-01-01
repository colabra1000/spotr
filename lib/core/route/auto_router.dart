import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/authentication/presentation/pages/buddies_page.dart';
import '../../features/authentication/presentation/pages/discover_page.dart';
import '../../features/authentication/presentation/pages/home_page.dart';
import '../../features/authentication/presentation/pages/profile_page.dart';
import '../../features/authentication/presentation/pages/registration_page.dart';
import '../../features/authentication/presentation/pages/reset_password_page.dart';
import '../../features/authentication/presentation/pages/settings_page.dart';
import '../../features/authentication/presentation/pages/verify_page.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/app_init.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: AppInit,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: LoginPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: RegistrationPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: ResetPasswordPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: VerifyPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
        page: HomePage,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        children: [
          CustomRoute(page: ProfilePage),
          CustomRoute(page: BuddiesPage),
          CustomRoute(page: DiscoverPage),
          CustomRoute(page: SettingsPage),
        ]),

    // AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
