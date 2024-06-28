import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

///
/// Update the colors below according to your use case.
///
const Color blackColor = Colors.black;
const Color backgoundColor = Color(0xffEBEBEB);
const Color primaryColor = Color(0xFF4479FF);
const Color whiteColor = Colors.white;
const Color greyColor = Color(0xffD9D9D9);
const Color lightGreyColor = Color(0xffD9D9D9);
const Color borderColor = Color(0xff777777);
const Color redColor = Color(0xffBB0F0F);
const Color lightRedColor = Color(0xffE9A3A3);
const Color brownColor = Color(0xffA03131);

const Color blueColor = Color(0xff221EBF);
const Color lightBlueColor = Color(0xff8E8DE4);
const Color darkBlueColor = Color(0xff1D0368);
const Color greenColor = Color(0xff0BCE83);
const Color texfieldColor = Color(0xff828282);

/// Gradients
LinearGradient gradient1 = const LinearGradient(
  colors: [
    Color(0xffDB5614),
    Color(0xffE27A17),
    Color(0xffE69219),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradientTransparent = const LinearGradient(
  colors: [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradient2 = const LinearGradient(
  colors: [
    Color(0xffE69219),
    Color(0xffE27A17),
    Color(0xffDB5614),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient gradientMessage = const LinearGradient(
  colors: [Color(0xff4A4A4A), Color(0xff4A4A4A), Color(0xff4A4A4A)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

///
/// PIN THEME COLOR
///
final defaultPinTheme = PinTheme(
  width: 70.w,
  height: 60.h,
  textStyle: const TextStyle(
      fontSize: 22, color: primaryColor, fontWeight: FontWeight.w700),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.r),
    border: Border.all(color: borderColor),
  ),
);
