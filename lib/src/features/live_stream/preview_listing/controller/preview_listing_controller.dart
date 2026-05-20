import '../../../../app/routes/app_route.dart';
import '../../../../global/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class PreviewListingController extends GetxController {
  void finish() {
    // Navigate back to Dashboard and reset the stack, passing the target tab index
    Get.offAllNamed(AppRouteKeys.dashboard, arguments: 2);
  }
}
