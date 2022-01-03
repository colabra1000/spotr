import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/features/authentication/presentation/widgets/enums.dart';

import '../../../../core/features/authentication/authentication_ui_helper.dart';
import '../../../../core/features/authentication/bloc/authentication_bloc.dart';
import '../../../../core/helpers/form_validation_helper.dart';
import '../../../../core/route/auto_router.gr.dart';

import '../../../../core/ui/textstyles.dart';
import '../widgets/label_and_text_field.dart';
import '../widgets/layout1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final modalController = CModalController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

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
      child: CModal(
        controller: modalController,
        child: Layout1(
          heading: heading(),
          subHeading: subHeading(context),
          body: body(),
          subBottom: subBottom(),
          bottom: bottom(context),
        ),
      ),
    );
  }

  Widget heading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello!",
          style: bigText.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Login Now",
          style: bigText.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget subHeading(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dont have an account? /",
          style: smallText,
        ),
        TextButton(
          onPressed: () {
            context.router.replace(RegistrationRoute());
          },
          child: Text(
            "create one",
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
        children: [
          LabelAndTextField(
            textFieldType: TextFieldType.text,
            validator: FormValidationHelper.validateUsernameOrPhoneNumber,
            controller: _usernameController,
            label: "username / phone number",
          ),
          SizedBox(
            height: 20.h,
          ),
          LabelAndTextField(
            textFieldType: TextFieldType.password,
            validator: FormValidationHelper.validatePassword,
            controller: _passwordController,
            label: "password",
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget subBottom() {
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
          "login",
          style: smallTextLight,
        ),
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent(
              usernameOrPhoneNumber: _usernameController.text.trim(),
              password: _passwordController.text.trim(),
            ));
          }
        },
        color: Colors.blue,
      ),
    );
  }
}
