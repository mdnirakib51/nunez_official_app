import 'package:get/get.dart';

class SellerDescriptionController extends GetxController {
  var selectedIndex = (-1).obs;

  final List<String> descriptions = [
    "I'm just starting",
    "I'm actively selling online or in person",
  ];

  void selectDescription(int index) {
    selectedIndex.value = index;
  }
}
