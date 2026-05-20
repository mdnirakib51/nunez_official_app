import '../../../../app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesFormatController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final bidStartController = TextEditingController();
  final dateTimeController = TextEditingController();
  final regularPriceController = TextEditingController();
  final discountPriceController = TextEditingController();
  
  final RxString salesFormat = 'Auction'.obs; // 'Auction' or 'Buy it Now'
  final RxBool isFreeShipping = false.obs;

  void setSalesFormat(String format) {
    salesFormat.value = format;
  }

  void toggleFreeShipping(bool value) {
    isFreeShipping.value = value;
  }

  void selectDateTime(BuildContext context) async {
    // Logic for date and time picker can be added here
  }

  @override
  void onClose() {
    bidStartController.dispose();
    dateTimeController.dispose();
    regularPriceController.dispose();
    discountPriceController.dispose();
    super.onClose();
  }
}
