import 'package:get/get.dart';
import '../controller/category_selection_controller.dart';

class CategorySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategorySelectionController>(() => CategorySelectionController());
  }
}
