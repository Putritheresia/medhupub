// ignore: unnecessary_import
import 'package:diabetease/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get fillRed => BoxDecoration(
    color: appTheme.red500,
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder10 => BorderRadius.circular(10.h,);
  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.h,);
}