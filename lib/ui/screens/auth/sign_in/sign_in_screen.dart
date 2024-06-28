// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(builder: (context, model, child) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please enter your Phone Number and Select Your Country",
                      style: style18.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "We will send you Verification code",
                      style: style14.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Your Country",
                      style: style16.copyWith(color: primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        model.showPicker(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 56.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.2, color: primaryColor),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 24.sp,
                                  color: primaryColor,
                                ),
                                SizedBox(width: 15.w),
                                model.country != null
                                    ? Text(
                                        model.country!.name,
                                        style: style18.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : Text(
                                        "Select Country",
                                        style: style18.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: primaryColor,
                              size: 28.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Your Phone Number",
                      style: style16.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        if (model.country == null) {
                          Get.snackbar(
                              "Country", "Please select a country first.");
                        }
                      },
                      child: TextFormField(
                        controller: model.phoneController,
                        enabled: model.country != null,
                        cursorColor: primaryColor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone number";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          // model.signInBody.phoneNumber = val;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 16.0, top: 20.0, bottom: 20.0),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: border,
                          focusedBorder: border,
                          hintText: 'Your phone number',
                          hintStyle: style16.copyWith(color: borderColor),
                          prefixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              // model.showPicker(context);
                            },
                            child: Container(
                              width: model.country != null ? 100 : 150,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Icon(
                                    Icons.phone,
                                    size: 20.sp,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  model.country != null
                                      ? Text(
                                          '+ ${model.country!.phoneCode}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "Select Country",
                                          style: style16.copyWith(
                                              color: primaryColor),
                                        ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Container(
                                    height: 24,
                                    width: 2.0,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            height: 170,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.transparent,
            child: Column(
              children: [
                CustomButton(
                  borderRadius: BorderRadius.circular(25),
                  onPressed: () {
                    if (model.isPhoneNumberLongEnough) {
                      if (_formKey.currentState!.validate()) {
                        String phoneNumber =
                            "+${model.country!.phoneCode}${model.phoneController.text}";
                        print("phone Number: $phoneNumber");

                        model.signInWithPhoneNumber(phoneNumber);
                      }
                    }
                  },
                  text: 'Sign In',
                  textColor: whiteColor,
                  boxColor: model.isPhoneNumberLongEnough
                      ? primaryColor
                      : primaryColor.withOpacity(0.2),
                  borderColor: model.isPhoneNumberLongEnough
                      ? primaryColor
                      : primaryColor.withOpacity(0.2),
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(25),
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Cancel',
                  textColor: primaryColor,
                  boxColor: whiteColor,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
