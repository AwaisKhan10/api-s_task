import 'package:flutter/material.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "",
  hintStyle:
      style14.copyWith(color: texfieldColor, fontWeight: FontWeight.normal),
  focusColor: whiteColor,
  prefixIconColor: primaryColor,
  suffixIconColor: primaryColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: greyColor, width: 0.3),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: greyColor, width: 0.3),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: greyColor, width: 0.3),
  ),
  disabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: greyColor, width: 0.3),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: greyColor, width: 0.3),
  ),
);

const border = UnderlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor,
    width: 1.0,
  ),
);
