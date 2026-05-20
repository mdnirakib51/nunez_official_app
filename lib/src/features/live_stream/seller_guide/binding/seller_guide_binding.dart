import 'package:get/get.dart';
import '../controller/seller_guide_controller.dart';

class SellerGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerGuideController>(() => SellerGuideController());
  }
}
