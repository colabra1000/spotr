import 'package:auto_route/auto_route.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/helpers/form_validation_helper.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/widgets/layout2.dart';
import 'package:spotr/features/main_app/presentation/widgets/settings_page_ui_helper.dart';

class SubSettingsPage extends StatefulWidget {
  const SubSettingsPage({Key? key}) : super(key: key);

  @override
  State<SubSettingsPage> createState() => _SubSettingsPageState();
}

class _SubSettingsPageState extends State<SubSettingsPage> {
  SettingsPageIdle settingsPageIdle = const SettingsPageIdle(
      settingsType: SettingsType.initial, fieldValue: "");

  final TextEditingController _fieldInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _cModalController = CModalController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsPageBloc, SettingsPageState>(
      listener: (context, state) {
        SettingsPageUiHelper.resolveUIState(
            state: state, modalController: _cModalController, context: context);

        if (state is SettingsPageAlert || state is SettingsPageError) {
          AutoTabsRouter.of(context).setActiveIndex(0);
        }
      },
      child:
          BlocSelector<SettingsPageBloc, SettingsPageState, SettingsPageIdle>(
        selector: (state) {
          if (state is SettingsPageIdle) {
            settingsPageIdle = state;
            return state;
          }
          return settingsPageIdle;
        },
        builder: (context, state) {
          String label;
          _fieldInputController.text = state.fieldValue;

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

          return CModal(
            controller: _cModalController,
            child: Layout2(
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
                  height: 250.h,
                  child: state.settingsType != SettingsType.updateUsername
                      ? const Center(
                          child: Text("not yet implemented"),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state.settingsType !=
                                SettingsType.updatePassword)
                              Text(
                                "current ",
                                style: tinyText,
                              ),
                            Text(
                              state.fieldValue,
                              style: mediumText,
                            ),
                            if (state.settingsType !=
                                SettingsType.updatePassword)
                              Divider(color: Colors.grey.shade600),
                            SizedBox(height: 20.h),
                            Text("new ", style: tinyText),
                            SizedBox(height: 10.h),
                            _mTextField(state),
                            SizedBox(
                              height: 50.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CupertinoButton(
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  "change ",
                                  style: smallTextLight,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    BlocProvider.of<SettingsPageBloc>(context)
                                        .add(UpdateUserInfoEvent(
                                            settingsType: state.settingsType,
                                            fieldValue:
                                                _fieldInputController.text));
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                )),
          );
        },
      ),
    );
  }

  Widget _mTextField(SettingsPageIdle state) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) => state.settingsType == SettingsType.updateEmail
            ? FormValidationHelper.validateEmail(value)
            : state.settingsType == SettingsType.updatePassword
                ? FormValidationHelper.validatePassword(value)
                : state.settingsType == SettingsType.updateUsername
                    ? FormValidationHelper.validateUsername(value)
                    : null,
        style: smallText,

        decoration: InputDecoration(
          errorStyle: tinyText.copyWith(
            color: Colors.red,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          label: Text(
            "username",
            style: smallTextFade,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        // decoration: In,
        controller: _fieldInputController,
      ),
    );
  }
}
