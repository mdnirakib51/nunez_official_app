import 'package:get/get.dart';
import '../controller/create_listing_controller.dart';

class CreateListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateListingController>(() => CreateListingController());
  }
}
