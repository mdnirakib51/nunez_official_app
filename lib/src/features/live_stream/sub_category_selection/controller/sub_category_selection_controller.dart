import 'package:get/get.dart';

class SubCategorySelectionController extends GetxController {
  var selectedSubCategory = "Disney".obs;

  final List<String> subCategories = [
    "Disney",
    "Funko",
    "Action Figures",
    "Diecast",
    "Funko",
    "Star wars",
    "Dolls",
    "Plush",
  ];

  void selectSubCategory(String name) {
    selectedSubCategory.value = name;
  }
}
