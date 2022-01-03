import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:spotr/features/main_app/presentation/pages/main_settings_page.dart';
import 'package:spotr/features/main_app/presentation/pages/sub_settings_page.dart';

import '../../features/main_app/presentation/pages/buddies_page.dart';
import '../../features/main_app/presentation/pages/discover_page.dart';
import '../../features/main_app/presentation/pages/home_page.dart';
import '../../features/main_app/presentation/pages/profile_page.dart';
import '../../features/authentication/presentation/pages/registration_page.dart';
import '../../features/authentication/presentation/pages/reset_password_page.dart';
import '../../features/main_app/presentation/pages/settings_page.dart';
import '../../features/authentication/presentation/pages/verify_page.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../app_init.dart';

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
          CustomRoute(page: SettingsPage, children: [
            CustomRoute(page: MainSettingsPage),
            CustomRoute(page: SubSettingsPage),
          ]),
        ]),

    // AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
