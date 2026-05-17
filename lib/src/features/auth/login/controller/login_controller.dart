import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../domain/model/auth_model.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  LoginController({required this.authRepository});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "md.rakib3248@gmail.com");
  final passwordController = TextEditingController(text: "123456");

  final isLoading = false.obs;

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
    return null;
  }

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;
    try {
      // API call logic here
      log("Login attempted with: ${emailController.text}");
      
      // Navigate to Dashboard on successful login
      Get.offAllNamed(AppRouteKeys.dashboard);
    } catch (e) {
      log("Error during login: ${e.toString()}");
    } finally {
      isLoading.value = false;
      FocusScope.of(Get.context!).unfocus();
    }
  }

  void loginWithGoogle() {
    log("Google Login attempted");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
