import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/notr/presentation/widgets/layout2.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout2(
      cardOne: SizedBox(
        height: .4.sh,
        width: double.infinity,
      ),
      labelTwo: "Preferences",
      cardTwo: showPreferenceCard(),
    );
  }

  Widget showPreferenceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("change password", style: smallText),
        Text("update Email", style: smallText),
        Text("update username", style: smallText),
        Text("logout", style: smallText)
      ],
    );
  }
}
