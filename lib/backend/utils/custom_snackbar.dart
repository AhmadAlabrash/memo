import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymove/widgets/text_labels/title_heading3_widget.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';

class CustomSnackBar {
   
  static success(String message) {
    return Get.snackbar(
      'Success',
      message,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.5,
          vertical: Dimensions.paddingSize * 0.5),
      backgroundColor: CustomColor.primaryLightColor.withValues(alpha:0.5),
      colorText: CustomColor.whiteColor,
      leftBarIndicatorColor: CustomColor.greenColor,
      progressIndicatorBackgroundColor: CustomColor.redColor,
      isDismissible: true,
      animationDuration: const Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 5.0,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
          // Get.close(0);
        },
        child:  const TitleHeading3Widget(
         text: "Dismiss",
      color: CustomColor.whiteColor,
        ),
      ),
      icon: const Icon(
        Icons.check_circle_rounded,
        color: CustomColor.greenColor,
      ),
    );
  }

  static error(String message) {
    return Get.snackbar('Alert', message,
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * 0.5,
            vertical: Dimensions.paddingSize * 0.5),
        backgroundColor: CustomColor.redColor.withValues(alpha:0.8),
        colorText: CustomColor.whiteColor,
        leftBarIndicatorColor: CustomColor.redColor,
        progressIndicatorBackgroundColor: CustomColor.redColor,
        isDismissible: true,
        animationDuration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 5.0,
        mainButton: TextButton(
          onPressed: () {
            Get.back();
            // Get.close(1);
          },
               child: const TitleHeading3Widget(
            text: "Dismiss",
            color: CustomColor.whiteColor,
          ),
        ),
        icon: const Icon(
          Icons.warning,
          color: CustomColor.redColor,
        ));
  }
}
