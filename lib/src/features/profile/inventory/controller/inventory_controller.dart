import 'package:get/get.dart';

class InventoryController extends GetxController {
  var selectedFilter = "Active".obs;
  var searchText = "".obs;

  final products = [
    {
      "title": "Zara Original Hand bag",
      "img": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
      "qty": "40",
      "status": "Brand New",
      "price": "10.00",
    },
  ].obs;

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
