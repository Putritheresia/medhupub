import 'package:diabetease/theme/custom_button_style.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../theme/custom_text_style.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';


class Registerscreen extends StatelessWidget {
  Registerscreen ({Key? key})
      : super(
        key: key,
      );

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  @override  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 38.v),
          child: Column(
            children: [
              SizedBox(height: 16.v),
              CustomImageView(
                imagePath: ImageConstant.imgOnlineMedicalConsultation,
                height: 216.v,
                width: 304.h,
                margin: EdgeInsets.symmetric(horizontal: 18.h),
              ),
              SizedBox(height: 36.v),
              _buildTextWelcoming(context),
              SizedBox(height: 46.v),
              _buildfirstname(context),
              SizedBox(height: 12.v),
              _buildlastname(context),
              SizedBox(height: 64.v),
              _nextsection(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildfirstname(BuildContext context) {
    return Container(
      width: 312.h,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 18.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "FirsName",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: firstnameController,
            textInputAction: TextInputAction.done,
          )
        ],
      ),
    );
  }

  Widget _buildlastname(BuildContext context) {
    return Container(
      width: 312.h,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 18.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "Last Name",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          CustomTextFormField(
            controller: lastnameController,
            textInputAction: TextInputAction.done,
          )
        ],
      ),
    );
  }

  Widget _nextsection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomElevatedButton(
            height: 44.v,
            width: 138.h,
            text: "Next",
            onPressed: () {
              toNext(context);
            },
          ),
          SizedBox(height: 20.v),
          Text(
            "Already have an account?",
            style: CustomTextStyles.bodyLargeRobotoBlack900,
          ),
          GestureDetector(
            onTap: () {
              login(context);
            },
            child: Text(
            "Login Now",
            style: CustomTextStyles.bodyLargeKhmerTeal200,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWelcoming(BuildContext context) {
    return Text(
      "Who Will Be Joining Us?",
      style: CustomTextStyles.headlineSmallRobotoFlexRed500,
    );
  }

  toNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logNextScreen);
  }

  login(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginscreen);
  }
}