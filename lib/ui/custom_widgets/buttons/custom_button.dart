// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final onPressed;
  String? text;
  Color? textColor;
  Color? boxColor;
  Color? borderColor;
  BorderRadius? borderRadius;
  CustomButton(
      {this.onPressed,
      this.text,
      this.textColor,
      this.boxColor,
      this.borderColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: borderRadius ?? BorderRadius.circular(25.r),
            border: Border.all(width: 1.0, color: borderColor ?? primaryColor)),
        child: Text(
          "$text",
          style: style18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontFamily: allerta),
        ),
      ),
    );
  }
}
