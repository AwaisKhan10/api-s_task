// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/custom_widgets/buttons/drop_down.dart';
import 'package:pickmed/ui/screens/add_buisness/add_buisness_view_model.dart';
import 'package:provider/provider.dart';

class InformationScreen extends StatelessWidget {
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
            /// Box Container Detail Fields
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
                  /// Enter then Name
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20.w),
                      Icon(
                        Icons.person_outlined,
                        color: texfieldColor,
                        size: 28.sp,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: model.nameController,
                          cursorColor: primaryColor,
                          onChanged: (text) => model.updatePrimaryColor(),
                          decoration: authFieldDecoration.copyWith(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///
                  /// Enter then Field
                  ///
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.w),
                        Icon(
                          Icons.folder_sharp,
                          color: texfieldColor,
                          size: 28.sp,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: model.fieldController,
                            cursorColor: primaryColor,
                            onChanged: (text) => model.updatePrimaryColor(),
                            decoration: authFieldDecoration.copyWith(
                              hintText: 'Field',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///
                  /// Custom DropdownCard
                  ///
                  /// Select then organization
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20.w),
                      Icon(
                        Icons.home,
                        color: texfieldColor,
                        size: 28.sp,
                      ),
                      Expanded(
                        child: CustomDropdownCard(
                          title: model.selected,
                          items: model.organization,
                          onItemSelected: (val) {
                            model.selected = val!;
                            model.setState(ViewState.idle);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            ///
            /// Enter the Bio
            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.change_circle_outlined,
                      color: greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: TextFormField(
                        controller: model.bioController,
                        maxLines: 6,
                        cursorColor: primaryColor,
                        onChanged: (text) => model.updatePrimaryColor(),
                        decoration: authFieldDecoration.copyWith(
                          hintText: 'Business Bio',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      ///
      /// Bottom Sheet
      ///
      bottomSheet: Container(
        height: 170,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        child: Column(
          children: [
            Consumer<AddBuisnessViewModel>(
              builder: (context, model, child) => CustomButton(
                borderRadius: BorderRadius.circular(25),
                onPressed: () {
                  if (model.nameController.text.isEmpty ||
                      model.nameController.text == null) {
                    Get.snackbar("Error", "Please fill the name.");
                  } else if (model.fieldController.text.isEmpty ||
                      model.fieldController.text == null) {
                    Get.snackbar("Error", "Please fill the field.");
                  } else if (model.selected == null ||
                      model.selected.isEmpty ||
                      model.selected == "Organization Type") {
                    Get.snackbar("Error", "Please select an organization.");
                  } else if (model.bioController.text.isEmpty ||
                      model.bioController.text == null) {
                    Get.snackbar("Error", "Please fill the Bio.");
                  } else {
                    model.nextPage(1); // Navigate to next page
                  }
                },
                text: 'Save',
                borderColor: model.primaryColor,
                textColor: whiteColor,
                boxColor: model.primaryColor,
              ),
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
