import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';

class ForgotController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final setNewPassFormKey = GlobalKey<FormState>();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // OTP Fields
  final otpControllers = List.generate(6, (index) => TextEditingController());
  final focusNodes = List.generate(6, (index) => FocusNode());
  final otpValues = List.generate(6, (index) => "").obs;

  final isLoading = false.obs;
  final timerText = "00:15".obs;
  final canResend = false.obs;
  late Timer _timer;
  int _start = 15;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    _start = 15;
    canResend.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        canResend.value = true;
      } else {
        _start--;
        timerText.value = "00:${_start.toString().padLeft(2, '0')}";
      }
    });
  }

  // Forgot Password Screen Logic
  void sendResetCode() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // Simulate API call
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        startTimer();
        Get.toNamed(AppRouteKeys.forgotOtp);
      });
    }
  }

  void resendCode() {
    if (canResend.value) {
      startTimer();
      log("Resending OTP...");
    }
  }

  // OTP Verification Logic
  void verifyOTP() {
    String otp = otpValues.join();
    if (otp.length < 6) {
      return;
    }
    
    isLoading.value = true;
    log("Verifying OTP: $otp");
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
      Get.toNamed(AppRouteKeys.resetPass);
    });
  }

  // Set New Password Screen Logic
  void resetPassword() {
    if (setNewPassFormKey.currentState!.validate()) {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        Get.toNamed(
          AppRouteKeys.congratulation,
          arguments: {
            'title': 'Congratulations',
            'subTitle': 'Your password has been successfully changed.',
            'onTap': () => Get.offAllNamed(AppRouteKeys.login),
          },
        );
      });
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (!GetUtils.isEmail(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
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
    if (value != passwordController.text) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    if(canResend.value == false) _timer.cancel();
    super.onClose();
  }
}
