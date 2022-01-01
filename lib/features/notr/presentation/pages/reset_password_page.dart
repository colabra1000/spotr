import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:spotr/core/authentication/authentication_ui_helper.dart';
import 'package:spotr/core/helpers/form_validation_helper.dart';
import 'package:spotr/core/route/auto_router.gr.dart';
import 'package:spotr/features/notr/presentation/bloc/verify_page/verify_page_bloc.dart';
import 'package:spotr/features/notr/presentation/widgets/enums.dart';

import '../../../../core/authentication/bloc/authentication_bloc.dart';
import '../../../../core/ui/textstyles.dart';
import '../widgets/label_and_text_field.dart';
import '../widgets/layout1.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool verificationEmailIsSent = false;
  bool verificationCodeIsSent = false;
  CModalController modalController = CModalController();

  TextEditingController emailTextController =
      TextEditingController(text: "r@mailinator.com");
  final _formKey = GlobalKey<FormState>();

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
          subHeading: subHeading(),
          body: body(),
          subBottom: subBottom(),
          bottom: bottom(),
        ),
      ),
    );
  }

  Widget heading() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Reset password",
            style: bigText.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget subHeading() {
    return const Align(
        alignment: Alignment.center, child: Text("Enter your email"));
  }

  Widget body() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if(emailTextController.){
          Form(
            key: _formKey,
            child: LabelAndTextField(
                textFieldType: TextFieldType.email,
                validator: FormValidationHelper.validateEmail,
                controller: emailTextController,
                label: "email"),
          )

          // }
        ],
      ),
    );
  }

  Widget subBottom() {
    return const Align(
        alignment: Alignment.center,
        child: Text("a password reset link would be send to your email"));
  }

  Widget bottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 30.h,
        ),
        CupertinoButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "send email",
            style: smallTextLight,
          ),
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              BlocProvider.of<AuthenticationBloc>(context).add(
                  SendPasswordResetLinkEvent(
                      email: emailTextController.text.trim()));
            }
          },
        ),
      ],
    );
  }
}
