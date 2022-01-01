import 'package:flutter/material.dart';
import 'package:spotr/core/ui/textstyles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "welcome",
          style: bigText,
        ),
      ),
    );
  }
}
