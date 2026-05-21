import 'package:get/get.dart';
import '../controller/inventory_controller.dart';

class InventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }
}
