// ignore_for_file: unnecessary_import

import 'package:diabetease/theme/theme_helper.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import '../core/app_export.dart';

extension on TextStyle {
  // ignore: unused_element
  TextStyle get robotoFlex {
    return copyWith(
      fontFamily: 'RobotoFlex',
    );
  }

  TextStyle get khmer {
    return copyWith(
      fontFamily: 'Khmer',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

class CustomTextStyles {
  static get bodyLargeKhmerBlack900 => theme.textTheme.bodyLarge!.khmer.copyWith(
    color: appTheme.black900.withOpacity(0.62),
    fontSize: 17.fSize,
  );
  static get bodyLargeKhmerRed500 => theme.textTheme.bodyLarge!.khmer.copyWith(
    color: appTheme.red500,
    fontSize: 17.fSize,
  );
  static get bodyLargeKhmerTeal200 => theme.textTheme.bodyLarge!.khmer.copyWith(
    color: appTheme.teal200,
    fontSize: 17.fSize,
  );
  static get bodyLargeRobotoBlack900 => theme.textTheme.bodyLarge!.roboto.copyWith(
    color: appTheme.black900.withOpacity(0.62),
    fontSize: 17.fSize,
  );
  static get bodyMediumPoppinsDeeppurple400 => theme.textTheme.bodyMedium!.poppins.copyWith(
    color: appTheme.black900.withOpacity(0.62),
    fontSize: 17.fSize,
  );
  static get headlineSmallRobotoFlexRed500 => theme.textTheme.headlineSmall!.khmer.copyWith(
    color: appTheme.red500,
    fontSize: 25.fSize,
    fontWeight: FontWeight.w700,
  );
  static get displayMediumBlack900 => theme.textTheme.displayMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 48.fSize,
    fontWeight: FontWeight.w800,
  );
  static get titleLargePink9001 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.pink400,
    fontWeight: FontWeight.w400,
  );
}
