import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:c_modal/c_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/route/auto_router.gr.dart';

import '../../../../core/authentication/bloc/authentication_bloc.dart';
import '../../../../core/ui/textstyles.dart';
import '../widgets/label_and_text_field.dart';
import '../widgets/layout1.dart';

class VerifyByMailPage extends StatefulWidget {
  const VerifyByMailPage({Key? key}) : super(key: key);

  @override
  State<VerifyByMailPage> createState() => _VerifyByMailPageState();
}

class _VerifyByMailPageState extends State<VerifyByMailPage> {
  @override
  Widget build(BuildContext context) {
    return Layout1(
      heading: heading(),
      subHeading: subHeading(context),
      body: body(),
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
          SizedBox(
            height: 20.h,
          ),
          Text(
            "By Email",
            style: bigText,
          ),
        ],
      ),
    );
  }

  Widget subHeading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Follow the confirmation email sent to email@mail.com to confirm your account",
          style: smallText,
        ),
      ],
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        CupertinoButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "send verification email now",
            style: smallTextLight,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
