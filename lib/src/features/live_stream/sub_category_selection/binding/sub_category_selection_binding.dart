import 'package:get/get.dart';
import '../controller/sub_category_selection_controller.dart';

class SubCategorySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubCategorySelectionController>(() => SubCategorySelectionController());
  }
}
