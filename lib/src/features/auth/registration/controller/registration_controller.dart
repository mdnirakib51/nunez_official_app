
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/utils/toast_service.dart';
import '../../domain/model/auth_model.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;
  RegisterController({required this.authRepository});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final agreeTerms = false.obs;

  // Validation Logic
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }
    return null;
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

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!agreeTerms.value) {
      ToastService.error(AppStrings.agreeToTerms);
      return;
    }

    isLoading.value = true;
    try {
      // Simulate successful registration and navigate to OTP
      await Future.delayed(const Duration(seconds: 1));
      Get.toNamed(AppRouteKeys.otp);
    } catch (e) {
      log("Error during registration: ${e.toString()}");
    } finally {
      isLoading.value = false;
      FocusScope.of(Get.context!).unfocus();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
