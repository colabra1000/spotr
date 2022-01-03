import 'package:auto_route/auto_route.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/route/auto_router.gr.dart';
import 'package:spotr/features/authentication/presentation/widgets/label_and_text_field.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/widgets/field_editor.dart';

import '../../../../locator.dart';
import '../widgets/layout2.dart';
import '../../../../core/ui/textstyles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const AutoTabsScaffold(
      routes: [
        MainSettingsRoute(),
        SubSettingsRoute(),
      ],
    );
  }
}
