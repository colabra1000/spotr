import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/notr/presentation/bloc/profile_page/profile_page_bloc.dart';
import 'package:spotr/features/notr/presentation/widgets/layout2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageBloc(),
      child: Layout2(
        cardOne: displayProfilePanel(),
        labelTwo: "personal information",
        cardTwo: displayPersonalInformation(),
        labelThree: "interests",
        cardThree: displayInterests(
            interests: ["football", "golf", "tennis", "bowling", "boxing"]),
      ),
    );
  }

  Widget displayProfilePanel() {
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
          Text("Item Quancy", style: bigText),
          SizedBox(height: 5.h),
          Text("tijickt", style: mediumText),
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

  Widget displayPersonalInformation() {
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
              "08098987788",
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
              "bill@kenovule.ra",
              style: smallText,
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget displayInterests({required List<String> interests}) {
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
