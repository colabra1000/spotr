import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/widgets/layout2.dart';

class SubSettingsPage extends StatefulWidget {
  const SubSettingsPage({Key? key}) : super(key: key);

  @override
  State<SubSettingsPage> createState() => _SubSettingsPageState();
}

class _SubSettingsPageState extends State<SubSettingsPage> {
  SettingsPageIdle settingsPageIdle = const SettingsPageIdle(
      settingsType: SettingsType.initial, fieldValue: "");

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsPageBloc, SettingsPageState, SettingsPageIdle>(
      selector: (state) {
        print(state);
        if (state is SettingsPageIdle) {
          settingsPageIdle = state;
          return state;
        }
        return settingsPageIdle;
      },
      builder: (context, state) {
        print(state);
        String label;

        switch (state.settingsType) {
          case SettingsType.updateEmail:
            label = "email";
            break;
          case SettingsType.updatePassword:
            label = "password";
            break;
          case SettingsType.updateUsername:
            label = "username";
            break;
          default:
            label = "";
        }

        return Layout2(
            labelOne: Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                onPressed: () {
                  AutoTabsRouter.of(context).setActiveIndex(0);
                },
              ),
            ),
            labelTwo: "Update $label",
            cardTwo: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "current $label",
                    style: tinyText,
                  ),
                  Text(
                    state.fieldValue,
                    style: mediumText,
                  ),
                  Divider(color: Colors.grey.shade600),
                  SizedBox(height: 20.h),
                  Text("new $label", style: tinyText),
                  SizedBox(height: 10.h),
                  _mTextField(),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        label,
                        style: smallTextLight,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget _mTextField() {
    return TextField(
      style: smallText,

      decoration: InputDecoration(
        errorStyle: tinyText.copyWith(
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        label: Text(
          "username",
          style: smallTextFade,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      // decoration: In,
      controller: TextEditingController(),
    );
  }
}
