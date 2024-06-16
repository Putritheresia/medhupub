// ignore: unnecessary_import
// ignore_for_file: unnecessary_import, duplicate_ignore

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray50,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.red500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData( 
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.pink400,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 16.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.black900.withOpacity(0.62),
      fontSize: 15.fSize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.teal200,
      fontSize: 13.fSize,
      fontFamily: 'Khmer',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: appTheme.gray900,
      fontSize: 40.fSize,
      fontFamily: 'Roboto Flex',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 24.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 20.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
  );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(); 
}

class LightCodeColors {
  Color get black900 => const Color(0XFF000000);
  Color get blueGray400 => const Color(0XFF888888);
  Color get deepPurple400 => const Color(0XFF81689D);
  Color get gray50 => const Color(0XFFFEFAF6);
  Color get gray900 => const Color(0XFF151414);
  Color get pink400 => const Color(0XFFD63484);
  Color get red500 => const Color(0XFFEB4335);
  Color get teal200 => const Color(0XFF7FC7D9);
  Color get whiteA700 => const Color(0XFFFFFFFF);
  Color get red100 => const Color(0XFFF7DED0);
}