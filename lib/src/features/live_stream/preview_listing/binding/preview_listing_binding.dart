import 'package:get/get.dart';
import '../controller/preview_listing_controller.dart';

class PreviewListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewListingController>(
      () => PreviewListingController(),
    );
  }
}
