// ignore: unnecessary_import
import 'package:diabetease/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillTeal => ElevatedButton.styleFrom(
    backgroundColor: appTheme.teal200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );

  static ButtonStyle get outlinePrimary1 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.red100,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 2,
    ),
    shape: RoundedRectangleBorder(),
  );

}