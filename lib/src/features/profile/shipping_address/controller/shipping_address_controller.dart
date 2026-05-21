import 'package:get/get.dart';

class ShippingAddressController extends GetxController {
  var isFromSettings = false.obs;
  var selectedAddressId = "1".obs;
  var isDefault = true.obs;

  var addresses = <Map<String, dynamic>>[
    {
      "id": "1",
      "name": "Hasib r Rahman",
      "address": "123 road, Dhaka Bangladesh",
      "category": "Office",
      "isDefault": true,
    },
    {
      "id": "2",
      "name": "Shakil R Hossaain",
      "address": "123 road, Dhaka Bangladesh",
      "category": "Home",
      "isDefault": false,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is bool) {
      isFromSettings.value = Get.arguments;
    }
  }

  void selectAddress(String id) {
    selectedAddressId.value = id;
  }

  void toggleDefault(bool value) {
    isDefault.value = value;
  }
}
