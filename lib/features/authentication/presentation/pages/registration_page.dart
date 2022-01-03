import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/features/authentication/authentication_ui_helper.dart';
import '../../../../core/features/authentication/bloc/authentication_bloc.dart';
import '../bloc/registration_page/registration_page_bloc.dart';

import '../../../../core/helpers/form_validation_helper.dart';
import '../../../../core/route/auto_router.gr.dart';

import '../widgets/enums.dart';
import '../widgets/label_and_text_field.dart';
import '../widgets/layout1.dart';
import '../../../../core/ui/textstyles.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController(text: "colabra");
  final fullNameController = TextEditingController(text: "Item Quancy");
  final emailController = TextEditingController(text: "r@mailinator.com");
  final phoneNumberController = TextEditingController(text: "09098998789");
  final passwordController = TextEditingController(text: "password");
  List userInterests = [];

  final modalController = CModalController();

  final List<String> interests = [
    "soccer",
    "basketball",
    "rugby",
    "tennis",
    "badminton",
    "discus"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        AuthenticationUiHelper.resolveUIState(
          state: state,
          modalController: modalController,
          context: context,
        );
      },
      child: BlocProvider(
        create: (context) => RegistrationPageBloc(),
        child: CModal(
          controller: modalController,
          child: Layout1(
            heading: heading(),
            subHeading: subHeading(context),
            body: body(),
            subBottom: subBottom(context),
            bottom: bottom(context),
          ),
        ),
      ),
    );
  }

  Widget heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome!",
          style: bigText.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Register Now",
          style: bigText.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget subHeading(BuildContext context) {
    return Row(
      children: [
        Text(
          "already have an account? /",
          style: smallText,
        ),
        TextButton(
          onPressed: () {
            context.router.replace(const LoginRoute());
          },
          child: Text(
            "login",
            style: smallText,
          ),
        )
      ],
    );
  }

  Widget body() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelAndTextField(
              textFieldType: TextFieldType.text,
              controller: fullNameController,
              validator: FormValidationHelper.validateFullName,
              label: "full name"),
          SizedBox(
            height: 20.h,
          ),
          LabelAndTextField(
              textFieldType: TextFieldType.text,
              controller: userNameController,
              validator: FormValidationHelper.validateUsername,
              label: "username"),
          SizedBox(
            height: 20.h,
          ),
          LabelAndTextField(
              textFieldType: TextFieldType.email,
              controller: emailController,
              validator: FormValidationHelper.validateEmail,
              label: "email"),
          SizedBox(
            height: 20.h,
          ),
          LabelAndTextField(
              textFieldType: TextFieldType.phoneNumber,
              controller: phoneNumberController,
              validator: FormValidationHelper.validatePhoneNunmber,
              label: "phone number"),
          SizedBox(
            height: 20.h,
          ),
          LabelAndTextField(
              textFieldType: TextFieldType.password,
              controller: passwordController,
              validator: FormValidationHelper.validatePassword,
              label: "password"),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Interests",
            style: mediumText,
          ),
          Text(
            "select your sport of interest",
            style: tinyText,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocSelector<RegistrationPageBloc, RegistrationPageState,
              InterestsState>(
            selector: (state) {
              if (state is InterestsState) {
                return state;
              }
              return const InterestsState(interests: []);
            },
            builder: (context, state) {
              return Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                children: interests.map((e) {
                  bool active = state.interests.contains(e);

                  return ActionChip(
                    label: Text(e),
                    labelStyle: active ? tinyTextLight : tinyText,
                    backgroundColor: state.interests.contains(e)
                        ? Theme.of(context).primaryColor
                        : null,
                    onPressed: () {
                      userInterests = [...state.interests];
                      if (active) {
                        userInterests.remove(e);
                        BlocProvider.of<RegistrationPageBloc>(context)
                            .add(SelectInterests(interests: userInterests));
                      } else {
                        userInterests.add(e);
                        BlocProvider.of<RegistrationPageBloc>(context)
                            .add(SelectInterests(interests: userInterests));
                      }
                    },
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget subBottom(BuildContext context) {
    return Row(
      children: [
        Text(
          "Forgot password? /",
          style: smallText,
        ),
        TextButton(
          onPressed: () {
            context.router.push(const ResetPasswordRoute());
          },
          child: Text(
            "reset",
            style: smallText,
          ),
        )
      ],
    );
  }

  Widget bottom(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        child: Text(
          "Register",
          style: smallTextLight,
        ),
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            BlocProvider.of<AuthenticationBloc>(context).add(RegistrationEvent(
              fullName: fullNameController.text.trim(),
              username: userNameController.text.trim(),
              email: emailController.text.trim(),
              phoneNumber: phoneNumberController.text.trim(),
              password: passwordController.text.trim(),
              interests: userInterests,
            ));
          }
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
