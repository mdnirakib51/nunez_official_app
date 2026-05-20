import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final nameController = TextEditingController(text: "Micheal Thomas");
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController(text: "tanvirchowdhury123@gmail.com");
  final phoneController = TextEditingController();
  final nidController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    genderController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nidController.dispose();
    super.onClose();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  void saveChanges() {
    if (formKey.currentState!.validate()) {
      // Implement save logic
      Get.back();
    }
  }
}
