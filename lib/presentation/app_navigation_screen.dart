import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      :super(
        key: key,
      );

  @override  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(  
                  child: Container(  
                    decoration: AppDecoration.fillWhiteA,
                    child: Column(  
                      children: [
                        _buildScreenTitle( 
                          context,
                          screentitle: "homescreen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "registerscreen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.registerscreen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "nextregisterscreen",
                          ontapScreenTitle: () =>  ontapScreenTitle(context, AppRoutes.logNextScreen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "loginscreen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.loginscreen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "calculate_glucose_screen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.calculate_glucose_screen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "calculate_water_screen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.calculate_water_screen),
                        ),
                        _buildScreenTitle( 
                          context,
                          screentitle: "Bmi_screen",
                          ontapScreenTitle: () => ontapScreenTitle(context, AppRoutes.Bmi_screen),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA,
      child: Column(  
        children: [
          SizedBox(height: 10.v),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(  
              "App Navigation",
              textAlign: TextAlign.center,
              style: TextStyle(  
                color: appTheme.black900,
                fontSize: 20.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(  
              "Check your app's UI from the below demi screens of your app.",
              textAlign: TextAlign.center,
              style: TextStyle(  
                color: appTheme.blueGray400,
                fontSize: 16.fSize,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: appTheme.black900,
          )
        ],
      ),
    );
  }

  Widget _buildScreenTitle (
    BuildContext context, {
      required String screentitle,
      Function? ontapScreenTitle,
    }
  ) {
    return GestureDetector(
      onTap: () {
        ontapScreenTitle?.call();
      },
      child: Container(
        decoration: AppDecoration.fillWhiteA,
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Padding(  
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(  
                screentitle,
                textAlign: TextAlign.center,
                style: TextStyle(  
                  color: appTheme.black900,
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blueGray400,
            )
          ],
        ),
      ),
    );
  }

  void ontapScreenTitle(  
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }

}