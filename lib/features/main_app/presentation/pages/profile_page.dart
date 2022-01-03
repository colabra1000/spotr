import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/features/main_app/bloc/main_app_bloc.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import '../../../../locator.dart';
import '../bloc/profile_page/profile_page_bloc.dart';
import '../../../../core/ui/textstyles.dart';
import '../widgets/layout2.dart';

class ProfilePage extends StatelessWidget {
  // final UserInfo userInfo;
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAppBloc, MainAppState>(
      builder: (context, state) {
        UserInfo userInfo = UserInfo.empty();
        if (state is NewUserDetailState) {
          userInfo = state.userInfo;
        }

        return Layout2(
          cardOne: displayProfilePanel(
              name: userInfo.fullName, username: userInfo.username),
          labelTwo: "personal information",
          cardTwo: displayPersonalInformation(
              email: userInfo.email, phoneNumber: userInfo.phoneNumber),
          labelThree: "interests",
          cardThree: displayInterests(
            interests: userInfo.interests,
          ),
        );
      },
    );
  }

  Widget displayProfilePanel({required String name, required String username}) {
    return SizedBox(
      height: .4.sh,
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Container(
                  height: .2.sh,
                  width: .2.sh,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(40.r)),
                  child: const Placeholder(),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(name, style: bigText),
          SizedBox(height: 5.h),
          Text(username, style: mediumText),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              borderRadius: BorderRadius.circular(10),
              child: Text("settings", style: smallText),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  Widget displayPersonalInformation(
      {required String phoneNumber, required String email}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 20.w,
              color: Colors.green.shade300,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              phoneNumber,
              style: smallText,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Icon(
              Icons.mail,
              size: 20.w,
              color: Colors.blue.shade300,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              email,
              style: smallText,
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget displayInterests({required List interests}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String interest in interests) ...[
          Text(
            interest,
            style: smallText,
          ),
          SizedBox(
            height: 20.h,
          )
        ]
      ],
    );
  }
}
