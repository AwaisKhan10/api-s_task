// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/screens/add_buisness/add_buisness_screen.dart';
import 'package:pickmed/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: _appBar(model),

          ///
          /// Start Body
          ///
          body: ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),

                ///
                /// Button for Buisness
                ///
                GestureDetector(
                  onTap: () {
                    model.onClick();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddBuisnessScreen()));
                    Get.to(() => AddBuisnessScreen())?.then((_) {
                      model.resetSelection();
                      model.setState(ViewState.idle);
                    });
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: model.isSelect ? lightRedColor : greyColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: model.isSelect ? whiteColor : blackColor,
                            size: 24.sp,
                          ),
                          Text(
                            "New Buisness",
                            style: style16.copyWith(
                                color:
                                    model.isSelect ? whiteColor : blackColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Custom App Bar
///

_appBar(HomeViewModel model) {
  return AppBar(
    centerTitle: true,
    title: Text(
      "Home Screen",
      style: style18,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: IconButton(
            onPressed: () {
              model.logoutUser();
            },
            icon: Icon(
              Icons.logout_outlined,
              size: 28.sp,
              color: blackColor,
            )),
      )
    ],
  );
}
