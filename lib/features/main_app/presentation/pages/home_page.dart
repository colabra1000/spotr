import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';

import '../../../../core/features/main_app/bloc/main_app_bloc.dart';
import '../../../../core/route/auto_router.gr.dart';
import '../../../../core/ui/textstyles.dart';
import '../../../../locator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static GButton constructGButton(
      {required IconData icon, required String text}) {
    return GButton(
      icon: icon,
      text: text,
      textStyle: smallText,
      iconSize: 20.sp,
      gap: 10,
      padding: EdgeInsets.all(10.h),
      borderRadius: BorderRadius.circular(5.r),
      margin: EdgeInsets.all(10.h),
      backgroundColor: Colors.blue.withOpacity(.5),
    );
  }

  final List<GButton> bottomTabs = [
    constructGButton(
      icon: Icons.person,
      text: "profile",
    ),
    constructGButton(
      icon: CupertinoIcons.group_solid,
      text: "buddies",
    ),
    constructGButton(
      icon: CupertinoIcons.globe,
      text: "descover",
    ),
    constructGButton(
      icon: CupertinoIcons.gear_alt_fill,
      text: "settings",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => locator<MainAppBloc>(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => locator<SettingsPageBloc>(),
        ),
      ],
      child: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          return AutoTabsScaffold(
            routes: const [
              ProfileRoute(),
              BuddiesRoute(),
              DiscoverRoute(),
              SettingsRoute(),
            ],
            bottomNavigationBuilder: (_, tabsRouter) => GNav(
              onTabChange: (index) => tabsRouter.setActiveIndex(index),
              tabs: bottomTabs,
            ),
          );
        },
      ),
    );
  }
}
