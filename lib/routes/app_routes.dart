import 'package:diabetease/presentation/calculate_water_screen.dart';
import 'package:diabetease/presentation/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:diabetease/presentation/lognextscreen.dart';
import 'package:diabetease/presentation/registerscreen.dart';
import 'package:diabetease/presentation/homescreen.dart';
import 'package:diabetease/presentation/calculate_glucose_screen.dart';
import 'package:diabetease/presentation/bmi_screen.dart';

class AppRoutes {
  static const String homeScreen = '/homescreen';
  static const String loginscreen = '/loginscreen';
  static const String registerscreen = '/registerscreen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String logNextScreen = '/lognextscreen';
  static const String initialRoute = '/initialRoute';
  static const String calculate_glucose_screen = '/calculation_glucose_screen';
  static const String calculate_water_screen = '/calculate_water_screen';
  static const String Bmi_screen = '/bmi_screen';

  static Map<String, WidgetBuilder> routes = {
    loginscreen: (context) => Loginscreen(),
    logNextScreen: (context) => Lognextscreen(),
    initialRoute: (context) => Homescreen(),
    registerscreen: (context) => Registerscreen(),
    calculate_glucose_screen: (context) => BloodSugarCalc(),
    calculate_water_screen: (context) => WaterCalc(),
    Bmi_screen: (context) => BmiScreen(),
  };
}