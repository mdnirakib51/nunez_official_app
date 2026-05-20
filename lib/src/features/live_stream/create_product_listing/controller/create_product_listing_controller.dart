import '../../../../app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductListingController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final productTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  
  final RxString selectedCategory = ''.obs;
  final RxString selectedQuality = 'Used'.obs;
  final RxString selectedWeight = 'Below 1kg'.obs;
  final RxString selectedQuantity = '100'.obs;
  final RxBool isFreeShipping = false.obs;
  
  final List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  final List<String> qualities = ['New', 'Used', 'Refurbished'];
  final List<String> weights = ['Below 1kg', '1kg - 5kg', 'Above 5kg'];
  final List<String> quantities = ['10', '50', '100', '500'];

  void setCategory(String? value) {
    if (value != null) selectedCategory.value = value;
  }

  void setQuality(String? value) {
    if (value != null) selectedQuality.value = value;
  }

  void setWeight(String? value) {
    if (value != null) selectedWeight.value = value;
  }

  void setQuantity(String? value) {
    if (value != null) selectedQuantity.value = value;
  }

  void toggleFreeShipping(bool value) {
    isFreeShipping.value = value;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRouteKeys.salesFormat);
    }
  }

  @override
  void onClose() {
    productTitleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
