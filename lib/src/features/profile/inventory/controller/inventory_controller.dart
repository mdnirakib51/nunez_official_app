import 'package:get/get.dart';

class InventoryController extends GetxController {
  var selectedFilter = "Active".obs;
  var searchText = "".obs;

  final products = [
    {
      "title": "Zara Original Hand bag",
      "img": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "qty": "40",
      "status": "Brand New",
      "price": "10.00",
    },
  ].obs;

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
