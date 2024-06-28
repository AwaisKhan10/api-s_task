// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/screens/add_buisness/add_buisness_view_model.dart';
import 'package:pickmed/ui/screens/add_buisness/contact/contact_screen.dart';
import 'package:pickmed/ui/screens/add_buisness/informations/information_screen.dart';
import 'package:pickmed/ui/screens/add_buisness/location/location.dart';
import 'package:provider/provider.dart';

class AddBuisnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBuisnessViewModel(),
      child: Consumer<AddBuisnessViewModel>(
        builder: (context, model, child) => DefaultTabController(
          length: 3,
          child: Scaffold(
            ///
            /// Start Body
            ///
            body: Builder(builder: (context) {
              ///
              ///  Tab Controller
              ///
              final TabController tabController =
                  DefaultTabController.of(context);
              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  model.pageController.animateToPage(
                    tabController.index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              });
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60.h),
                    uplaodImage(onTap: () {}),
                    SizedBox(height: 30.h),

                    ///
                    /// Tab Bar
                    ///
                    TabBar(
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      unselectedLabelColor: primaryColor.withOpacity(0.70),
                      tabs: const <Widget>[
                        Tab(text: 'Information'),
                        Tab(text: 'Contact'),
                        Tab(text: 'Location'),
                      ],
                      onTap: (index) {
                        model.pageController.jumpToPage(index);
                      },
                    ),

                    ///
                    /// Tab Bar View Screens
                    ///
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: PageView(
                        controller: model.pageController,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable swiping
                        onPageChanged: (index) {
                          tabController.animateTo(index);
                        },
                        children: [
                          InformationScreen(),
                          ContactScreen(),
                          LocationScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

///
/// Image Upload function
///
uplaodImage({onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 60),
        decoration: BoxDecoration(
          color: texfieldColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: whiteColor.withOpacity(0.50),
              offset: const Offset(0.0, 2.0),
              spreadRadius: 4,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: texfieldColor,
              size: 24.sp,
            ),
            Text(
              "New Business",
              style: style16.copyWith(color: texfieldColor),
            )
          ],
        ),
      ),
    ),
  );
}
