import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class Lognextscreen extends StatelessWidget {
  Lognextscreen({Key? key})
      : super(key: key,);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

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
              _buildemail(context),
              SizedBox(height: 36.v),
              _buildpass(context),
              SizedBox(height: 36.v),
              _buildconfirmpass(context),
              SizedBox(height: 30.v),
              CustomElevatedButton(
                width: 138.h,
                text: "Register",
                buttonTextStyle: CustomTextStyles.bodyLargeKhmerTeal200,
              )
            ],
          ),
        ),
      ),
    );
   }

  Widget _buildemail(BuildContext context) {
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
              "Email",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: emailController,
          )
        ],
      ),
    );
  }

  Widget _buildpass(BuildContext context) {
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
              "Create Password",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: passwordController,
          )
        ],
      ),
    );
  }

  Widget _buildconfirmpass(BuildContext context) {
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
              "Confirm Pass",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10.v),
          CustomTextFormField(
            controller: confirmpassController,
          )
        ],
      ),
    );
  }

}