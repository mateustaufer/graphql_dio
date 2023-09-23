import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';
import '../themes/text_styles.dart';
import '../utils/responsive.dart';

class AppSnackBar {
  static void fail(String message) {
    Get.showSnackbar(
      GetSnackBar(
        icon: const Icon(
          Icons.highlight_off,
          color: AppColors.snackbarTextFail,
        ),
        messageText: Text(
          message,
          style: AppTextStyles.rubikRegularLarge.copyWith(
            color: AppColors.snackbarTextFail,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.snackbarBackgroundFail,
        duration: const Duration(seconds: 3),
        snackPosition: Responsive.isMobile(Get.context!)
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      ),
    );
  }

  static void alert(String message) {
    Get.showSnackbar(
      GetSnackBar(
        icon: const Icon(
          Icons.highlight_off,
          color: AppColors.snackbarTextAlert,
        ),
        messageText: Text(
          message,
          style: AppTextStyles.rubikRegularLarge.copyWith(
            color: AppColors.snackbarTextAlert,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.snackbarBackgroundAlert,
        duration: const Duration(seconds: 3),
        snackPosition: Responsive.isMobile(Get.context!)
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      ),
    );
  }

  static void success(String message) {
    Get.showSnackbar(
      GetSnackBar(
        icon: const Icon(
          Icons.highlight_off,
          color: AppColors.snackbarTextSuccess,
        ),
        messageText: Text(
          message,
          style: AppTextStyles.rubikRegularLarge.copyWith(
            color: AppColors.snackbarTextSuccess,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.snackbarBackgroundSuccess,
        duration: const Duration(seconds: 3),
        snackPosition: Responsive.isMobile(Get.context!)
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      ),
    );
  }
}
