import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final isLoading = false.obs;

  void submitTicket() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
      Get.back();
      Get.snackbar("Success", "Your issue has been submitted successfully");
    });
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
