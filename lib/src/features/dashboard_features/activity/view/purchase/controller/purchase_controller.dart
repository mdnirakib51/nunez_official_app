import 'package:get/get.dart';

class PurchaseController extends GetxController {
  var selectedFilter = "All".obs;

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
