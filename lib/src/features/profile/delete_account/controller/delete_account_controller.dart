import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';

class DeleteAccountController extends GetxController {
  final otpControllers = List.generate(6, (index) => TextEditingController());
  final focusNodes = List.generate(6, (index) => FocusNode());
  final otpValues = List.generate(6, (index) => "").obs;
  
  final isLoading = false.obs;

  void deleteAccount() {
    String otp = otpValues.join();
    if (otp.length < 6) {
      Get.snackbar("Error", "Please enter 6-digit OTP");
      return;
    }

    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
      Get.offAllNamed(AppRouteKeys.login);
      Get.snackbar("Success", "Account deleted successfully");
    });
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
