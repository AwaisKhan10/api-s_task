// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';

class CustomDropdownCard extends StatelessWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String?> onItemSelected;

  CustomDropdownCard({
    required this.title,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          focusColor: blackColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4.r),
          dropdownColor: Colors.grey[200],
          value: title,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: value == 'Organization Type'
                    ? style14.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.grey)
                    : style18.copyWith(
                        fontWeight: FontWeight.w400, color: primaryColor),
              ),
            );
          }).toList(),
          onChanged: onItemSelected,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff757575)),
          isExpanded: true,
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
