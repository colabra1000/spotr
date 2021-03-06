import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:spotr/core/features/authentication/bloc/authentication_bloc.dart';
import 'package:spotr/features/authentication/presentation/bloc/verify_page/verify_page_bloc.dart';

import '../../../../core/ui/textstyles.dart';
import '../widgets/layout1.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool verificationEmailIsSent = false;
  bool verificationCodeIsSent = false;
  CModalController modalController = CModalController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationIdleState) {
          modalController.dismissModal();
        }

        if (state is AuthenticationWorkingState) {
          modalController.changeModalState =
              CModalStateChanger(state: CModalState.loading);
        }

        if (state is AuthenticationErrorState) {
          showToast(
            state.errorMessage,
            position: StyledToastPosition.bottom,
            animation: StyledToastAnimation.slideFromBottom,
            context: context,
          );
        }
      },
      child: BlocProvider(
        create: (context) => VerifyPageBloc(),
        child: BlocBuilder<VerifyPageBloc, VerifyPageState>(
          builder: (context, state) {
            bool verifyByEmail = true;
            bool emailSent = false;
            bool codeSent = false;
            bool displaySendButton = true;

            if (state is VerifyByPhone) {
              verifyByEmail = false;
              codeSent = state.codeSent;
              displaySendButton = !state.codeSent;
            }

            if (state is VerifyByEmail) {
              verifyByEmail = true;
              emailSent = state.emailSent;
              displaySendButton = !state.emailSent;
            }

            return CModal(
              controller: modalController,
              child: Layout1(
                heading: heading(),
                subHeading: subHeading(verifyByEmail, context),
                body: verifyByEmail
                    ? verifyByEmailBody(emailSent)
                    : verifyByPhoneBody(codeSent),
                bottom:
                    displaySendButton ? bottom(context, verifyByEmail) : null,
              ),
            );
          },
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
            "Verify your account!",
            style: bigText.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget subHeading(bool verifyByEmail, BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionChip(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            onPressed: () {
              BlocProvider.of<VerifyPageBloc>(context)
                  .add(VerifyByEmailEvent(emailSent: verificationEmailIsSent));
            },
            label: const Text("By Email"),
            labelStyle: !verifyByEmail
                ? smallTextFade.copyWith(fontWeight: FontWeight.bold)
                : smallTextLight.copyWith(fontWeight: FontWeight.bold),
            backgroundColor:
                verifyByEmail ? Theme.of(context).primaryColor : null,
          ),
          SizedBox(
            width: 25.w,
          ),
          ActionChip(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            onPressed: () {
              BlocProvider.of<VerifyPageBloc>(context)
                  .add(VerifyByPhoneEvent(codeSent: verificationCodeIsSent));
            },
            label: const Text("By phone"),
            labelStyle: verifyByEmail
                ? smallTextFade.copyWith(fontWeight: FontWeight.bold)
                : smallTextLight.copyWith(fontWeight: FontWeight.bold),
            backgroundColor:
                !verifyByEmail ? Theme.of(context).primaryColor : null,
          ),
        ],
      ),
    );
  }

  Widget verifyByEmailBody(bool emailSent) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emailSent
                ? "An email has been sent to you"
                : "click the confirmation email sent to your email to confirm your account",
            style: smallText,
          ),
          if (emailSent)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("didn't recieve email?"),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(SendVerificationEmailEvent());
                    },
                    child: const Text("click here to resend")),
              ],
            ),
          SizedBox(height: 30.h),
          Text(
            "you would be redirected automatically when you verify your email.",
            style: tinyText,
          )
        ],
      ),
    );
  }

  Widget verifyByPhoneBody(bool emailSent) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emailSent
                ? "this feature is not yet implemented"
                : "Enter the code sent to your email below",
            style: smallText,
          ),
          if (emailSent)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("didn't recieve code?"),
                TextButton(
                    onPressed: () {},
                    child: const Text("click here to resend")),
              ],
            )
        ],
      ),
    );
  }

  Widget bottom(BuildContext context, bool verifyByEmail) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        CupertinoButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            verifyByEmail
                ? "send verification email now"
                : "this feature is not yet implemented",
            style: smallTextLight,
          ),
          onPressed: () {
            if (verifyByEmail) {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(SendVerificationEmailEvent());

              //update the ui
              verificationEmailIsSent = true;
              BlocProvider.of<VerifyPageBloc>(context)
                  .add(VerifyByEmailEvent(emailSent: verificationEmailIsSent));
            } else {
              verificationCodeIsSent = true;

              BlocProvider.of<VerifyPageBloc>(context)
                  .add(VerifyByPhoneEvent(codeSent: verificationCodeIsSent));
            }
          },
        ),
      ],
    );
  }
}
