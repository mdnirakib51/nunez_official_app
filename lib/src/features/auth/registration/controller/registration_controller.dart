
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ToastService.error("Passwords do not match");
      return;
    }

    isLoading.value = true;
    try {

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
