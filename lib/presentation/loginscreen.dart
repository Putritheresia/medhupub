import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({Key? key})
      : super(
        key: key,
      );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(  
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 50.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLoginImage,
                height: 286.v,
                width: 320.v,
                margin: EdgeInsets.symmetric(horizontal: 10.h),
              ),
              SizedBox(height: 14.v),
              _buildLoginSec(context),
              SizedBox(height: 12.v),
              _buildEmailsec(context),
              SizedBox(height: 12.v),
              _buildPasswordsec(context),
              SizedBox(height: 28.v),
              _buildActionSec(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSec(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 72.h),
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Login",
              style: CustomTextStyles.displayMediumBlack900,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmailsec(BuildContext context) {
    return Container(
      width: 312.h,
      margin: EdgeInsets.only(
        left: 12.h,
        right: 16.h,
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

  Widget _buildPasswordsec(BuildContext context) {
    return Container(
      width: 312.h,
      margin: EdgeInsets.only(
        left: 12.h,
        right: 18.h,
        ),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "Password",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            CustomTextFormField(
              controller: emailController,
              textInputAction: TextInputAction.done,
              obscureText: true,
            )
          ],
        ),
      );
  }

  Widget _buildActionSec(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 16.h),
      padding: EdgeInsets.only(
        left: 7.h,
        right: 4.h,
      ),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( 
              "Forget Passwords",
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 4.v),
            Text(
              "Change Password",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 24.v),
            CustomElevatedButton(
              width: 168.h,
              text: "Login",
            ),
            SizedBox(height: 20.v),
            Text(
              "Don't have an account?",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyLargeKhmerBlack900,
            ),
            Container(
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
            ),
            GestureDetector(
              onTap: () {
                register(context);
              },
              child: Text(  
                "Register Now",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeKhmerTeal200,
              ),
            )
          ],
        ),
      );
  }

  register(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerscreen);
  }

}