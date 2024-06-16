import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/custom_outline_button.dart';


class Homescreen extends StatelessWidget {
  Homescreen({Key? key})
      : super(
        key: key,
      );

  @override  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(  
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 10.v),
          child: Column(
            children: [
              _dashboardRow(context),
              SizedBox(height: 68.v),
              _mainColumn(context),
              SizedBox(height: 4.v),
              _mainColumn2(context),
              SizedBox(height: 4.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dashboardRow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 30.h,
              top: 34.v,
            ),
            child: Text(
              "Dashboard",
              style: CustomTextStyles.headlineSmallRobotoFlexRed500,
            ),
          ),
          CustomOutlineButton(
            width: 70.h,
          margin:EdgeInsets.zero,
            text: "Login",
            onPressed: () {
              toLogin(context);
            },
          )
        ],
      ),
    );
  }

  Widget _mainColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 18.h,
        right: 22.h,
      ),
      child: Column(
        children: [
          _row1(context)
        ],
      ),
    );
  }

  Widget _mainColumn2(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 18.h,
        right: 22.h,
      ),
      child: Column(
        children: [
          _row2(context)
        ],
      ),
    );
  }

  Widget _row2(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width:14.h),
          Expanded(
            child: _bloodsugarbutton(
              context,
              image: ImageConstant.imagescale,
              titleText: "BMI Calculator",
              glucal: () {
                bmi(context);
              },
            ),
          ),
          SizedBox(width:14.h),
          Expanded(
            child: _bloodsugarbutton(
              context,
              image: ImageConstant.logo,
              titleText: "History",
              glucal: () {
                glucal(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _row1(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width:14.h),
          Expanded(
            child: _bloodsugarbutton(
              context,
              image: ImageConstant.imagewater,
              titleText: "Water Intake Calculator",
              glucal: () {
                water(context);
              },
            ),
          ),
          SizedBox(width:14.h),
          Expanded(
            child: _bloodsugarbutton(
              context,
              image: ImageConstant.imageGlu,
              titleText: "Blood Sugar Level Calculator",
              glucal: () {
                glucal(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _bloodsugarbutton(
    BuildContext context, {
      required String image,
      required String titleText,
      Function? glucal,
    }
  ) {
    return GestureDetector(
      onTap: () {
        glucal?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 4.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(  
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.v),
            CustomImageView(
              imagePath: image,
              height: 100.h,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 40.h),
            ),
            SizedBox(height: 8.v),
            Text(
              titleText,
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.pink400,
              ),
            )
          ],
        ),
      ),
    );
  }

  water(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.calculate_water_screen);
  }

  bmi(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.Bmi_screen);
  }

  glucal(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.calculate_glucose_screen);
  }

  toLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginscreen);
  }
}