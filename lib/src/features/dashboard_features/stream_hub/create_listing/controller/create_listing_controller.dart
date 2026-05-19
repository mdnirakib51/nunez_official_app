import 'package:get/get.dart';

class CreateListingController extends GetxController {
  var isAgreed = false.obs;

  void toggleAgreement(bool? value) {
    isAgreed.value = value ?? false;
  }
}
