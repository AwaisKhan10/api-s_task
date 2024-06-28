// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/add_buisness/add_buisness_view_model.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AddBuisnessViewModel>(context);

    return Scaffold(
      ///
      /// Start Body
      ///
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),

            ///
            /// Header Fields
            ///
            ///
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.50),
                    offset: const Offset(0.0, 2.0),
                    spreadRadius: 0,
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///
                  /// Buisness Email Address
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20.w),
                      Icon(
                        Icons.email,
                        color: texfieldColor,
                        size: 28.sp,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: model.emailController,
                          onChanged: (text) => model.updatePrimaryColor(),
                          cursorColor: primaryColor,
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Buisness Email',
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///
                  /// Buisness Phone Number
                  ///
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.w),
                        Icon(
                          Icons.phone_outlined,
                          color: texfieldColor,
                          size: 28.sp,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (text) => model.updatePrimaryColor(),
                            keyboardType: TextInputType.phone,
                            controller: model.phoneController,
                            cursorColor: primaryColor,
                            decoration: authFieldDecoration.copyWith(
                              hintText: 'Buisness Phone',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///
                  /// Buisness  Website
                  ///
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.w),
                        Icon(
                          Icons.cloud_circle_rounded,
                          color: texfieldColor,
                          size: 28.sp,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (text) => model.updatePrimaryColor(),
                            keyboardType: TextInputType.text,
                            controller: model.buisnesswebsiteController,
                            cursorColor: primaryColor,
                            decoration: authFieldDecoration.copyWith(
                              hintText: 'Buisness  Website',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.50),
                      offset: const Offset(0.0, 2.0),
                      spreadRadius: 0,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Publish Your Buissness Contacts",
                      style: style16.copyWith(color: texfieldColor),
                    ),
                    Switch(
                      activeColor: primaryColor,
                      inactiveThumbColor: blackColor,
                      value: model.isSwitched,
                      onChanged: (value) {
                        model.isSwitchedClick(value);
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),

      ///
      /// Bottom Sheet
      ///
      bottomSheet: Container(
        height: 280,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        child: Column(
          children: [
            CustomButton(
              borderRadius: BorderRadius.circular(25),
              onPressed: () {
                if (model.emailController.text.isEmpty ||
                    model.emailController.text == null) {
                  Get.snackbar("Error", "Please Enter the email.");
                } else if (model.phoneController.text.isEmpty ||
                    model.phoneController.text == null) {
                  Get.snackbar("Error", "Please Enter the phone Number.");
                } else if (model.buisnesswebsiteController.text.isEmpty ||
                    model.buisnesswebsiteController.text == null) {
                  Get.snackbar("Error", "Please Enter the Website.");
                } else {
                  model.nextPage(2); // Navigate to next page
                }
              },
              text: 'Save',
              borderColor: model.primaryColor,
              textColor: whiteColor,
              boxColor: model.primaryColor,
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
  }
}
