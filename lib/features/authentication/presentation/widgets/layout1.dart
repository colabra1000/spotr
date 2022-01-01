import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout1 extends StatelessWidget {
  final Widget? heading;
  final Widget? subHeading;
  final Widget? body;
  final Widget? subBottom;
  final Widget? bottom;

  const Layout1(
      {Key? key,
      this.heading,
      this.subHeading,
      this.body,
      this.subBottom,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
              child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: ModalRoute.of(context)?.canPop == true
                        ? const BackButton()
                        : null,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 0.2.sh),
                  if (heading != null) heading!,
                  SizedBox(height: 20.h),
                  if (subHeading != null) subHeading!,
                  SizedBox(height: 20.h),
                  if (body != null) body!,
                  SizedBox(height: 10.h),
                  if (subBottom != null) subBottom!,
                  SizedBox(height: 10.h),
                  if (bottom != null) bottom!,
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
