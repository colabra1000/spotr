import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/widgets/layout2.dart';

class MainSettingsPage extends StatefulWidget {
  const MainSettingsPage({Key? key}) : super(key: key);

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Layout2(
      labelTwo: "Account",
      cardTwo: SizedBox(
        height: .3.sw,
        child: Center(
          child: Text(
            "Settings",
            style: mediumText,
          ),
        ),
      ),
      labelThree: "",
      cardThree: showPreferenceCard(),
    );
  }

  Widget showPreferenceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _doConstruction(
            onPressed: () {
              BlocProvider.of<SettingsPageBloc>(context)
                  .add(NavigateToUpdateUsernamePageEvent());
            },
            label: "update username"),
        _doConstruction(
            onPressed: () {
              BlocProvider.of<SettingsPageBloc>(context)
                  .add(NavigateToUpdatePasswordPageEvent());
            },
            label: "update password"),
        _doConstruction(
            onPressed: () {
              BlocProvider.of<SettingsPageBloc>(context)
                  .add(NavigateToUpdateEmailPageEvent());
            },
            label: "update email"),
      ],
    );
  }

  _doConstruction({required Function() onPressed, required String label}) {
    return Column(
      children: [
        Row(
          children: [
            Text(label, style: smallText),
            const Spacer(),
            TextButton(
                child: const Icon(CupertinoIcons.arrow_right_square),
                onPressed: () {
                  AutoTabsRouter.of(context).setActiveIndex(1);

                  onPressed();
                })
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
