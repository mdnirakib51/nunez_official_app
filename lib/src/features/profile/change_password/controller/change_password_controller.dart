import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  void changePassword() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // Simulate API call
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        Get.toNamed(
          AppRouteKeys.congratulation,
          arguments: {
            'title': 'Congratulations',
            'subTitle': 'Your password has been successfully changed.',
            'onTap': () => Get.offAllNamed(AppRouteKeys.dashboard),
          },
        );
      });
    }
  }

  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value.length < 6) {
      return AppStrings.passwordMinLength;
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value.length < 6) {
      return AppStrings.passwordMinLength;
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (value != newPasswordController.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
