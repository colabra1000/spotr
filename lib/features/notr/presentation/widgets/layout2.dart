import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/route/auto_router.gr.dart';
import 'package:spotr/core/ui/textstyles.dart';

class Layout2 extends StatelessWidget {
  final Widget? cardOne;
  final Widget? cardTwo;
  final Widget? cardThree;
  final Widget? cardFour;
  final String? labelOne;
  final String? labelTwo;
  final String? labelThree;
  final String? labelFour;
  const Layout2(
      {Key? key,
      this.labelOne,
      this.labelTwo,
      this.labelThree,
      this.labelFour,
      this.cardOne,
      this.cardTwo,
      this.cardThree,
      this.cardFour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                labelOne == null
                    ? displayPageHead(context)
                    : displayPanelHeading(label: labelOne!),
                if (cardOne != null) wrapInCard(child: cardOne!),
                if (labelTwo != null) displayPanelHeading(label: labelTwo!),
                if (cardTwo != null) wrapInCard(child: cardTwo!),
                if (labelThree != null) displayPanelHeading(label: labelThree!),
                if (cardThree != null) wrapInCard(child: cardThree!),
                if (labelFour != null) displayPanelHeading(label: labelFour!),
                if (cardFour != null) wrapInCard(child: cardFour!),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayPageHead(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Center(
        child: Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            onPressed: () => context.router.replace(const LoginRoute()),
            child: Text(
              "Logout",
              style: smallText,
            ),
          ),
        ),
      ),
    );
  }

  Widget displayPanelHeading({required String label}) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.h,
      child: Text(
        label,
        style: mediumText,
      ),
    );
  }

  Widget wrapInCard({required Widget child}) {
    return PhysicalModel(
      color: Colors.grey,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: child,
        ),
      ),
    );
  }
}
