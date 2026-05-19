import 'package:get/get.dart';
import '../controller/seller_description_controller.dart';

class SellerDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerDescriptionController>(() => SellerDescriptionController());
  }
}
