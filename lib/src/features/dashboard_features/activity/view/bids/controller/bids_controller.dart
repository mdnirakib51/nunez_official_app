import 'package:get/get.dart';

class BidsController extends GetxController {
  var selectedFilter = "All".obs;

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
