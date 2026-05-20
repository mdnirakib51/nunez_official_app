import 'package:get/get.dart';
import '../controller/create_product_listing_controller.dart';

class CreateProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProductListingController>(
      () => CreateProductListingController(),
    );
  }
}
