// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/otp_verify/otp_view_model.dart';

import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpVerifyViewModel(),
      child: Consumer<OtpVerifyViewModel>(
        builder: (context, model, child) => Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "Please enter the verification (PIN) Code",
                        style: style18.copyWith(color: primaryColor),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "You will receive the verification (PIN) code on your mobile number",
                        style: style14.copyWith(color: primaryColor),
                      ),
                      SizedBox(height: 40.h),
                      Align(
                        alignment: Alignment.center,
                        child: Pinput(
                          controller: model.OTPController,
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          autofocus: true,
                          validator: (pin) {
                            if (pin!.isEmpty) {
                              return "Please fill out this field.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            model.OTPController.text = val;
                          },
                          errorPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(40.r),
                            border: Border.all(color: primaryColor, width: 2),
                          )),
                          defaultPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                            color: const Color(0xffF7F8F9),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(0xffE8ECF4), width: 2),
                          )),
                          focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: primaryColor, width: 2),
                          )),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: primaryColor, width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(25),
                          onPressed: () {
                            if (model.OTPController.text.length > 5) {
                              if (_formKey.currentState!.validate()) {
                                String otpText = model.OTPController.text;
                                int otpNumber = int.tryParse(otpText) ?? 0;
                                model.VerifyOtpPhoneNumber(
                                  otpNumber,
                                );
                              }
                            }
                          },
                          text: 'Continue',
                          textColor: whiteColor,
                          boxColor: model.isotp
                              ? primaryColor
                              : primaryColor.withOpacity(0.20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(25),
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Cancel',
                          textColor: primaryColor,
                          boxColor: whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
