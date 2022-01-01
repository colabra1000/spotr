import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotr/core/ui/textstyles.dart';
import 'package:spotr/features/notr/presentation/widgets/enums.dart';

class LabelAndTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextFieldType textFieldType;

  const LabelAndTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.validator,
      this.textFieldType = TextFieldType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [
        textFieldType == TextFieldType.text
            ? AutofillHints.username
            : textFieldType == TextFieldType.email
                ? AutofillHints.email
                : textFieldType == TextFieldType.phoneNumber
                    ? AutofillHints.telephoneNumber
                    : AutofillHints.name
      ],
      keyboardType: textFieldType == TextFieldType.phoneNumber
          ? TextInputType.number
          : null,
      validator: validator,
      style: smallText,
      obscureText: textFieldType == TextFieldType.password ? true : false,
      controller: controller ?? TextEditingController(),
      decoration: InputDecoration(
        errorStyle: tinyText.copyWith(
          color: Colors.red,
        ),
        label: Text(
          label,
          style: smallTextFade,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
