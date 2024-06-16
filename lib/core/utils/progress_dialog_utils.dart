import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool isProgresiVisible = false;

  static void showProgressDialog({bool isCancellable = false}) async {
    if(!isProgresiVisible) {
      Get.dialog(
        // ignore: prefer_const_constructors
        Center(
          // ignore: prefer_const_constructors
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            // ignore: prefer_const_constructors
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
    }
  }

  static void hideProgressDialog() {
    if (isProgresiVisible) Get.back();
    isProgresiVisible = false;
  }
}