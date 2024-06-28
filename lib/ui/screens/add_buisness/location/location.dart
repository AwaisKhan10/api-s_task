// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/ui/screens/add_buisness/add_buisness_view_model.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddBuisnessViewModel>(
        builder: (context, model, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(children: [
                  SizedBox(
                    height: 60.h,
                  ),

                  ///
                  /// Uplaod Image
                  ///

                  const Text("location Screen"),
                ]),
              ),
            ));
  }
}
