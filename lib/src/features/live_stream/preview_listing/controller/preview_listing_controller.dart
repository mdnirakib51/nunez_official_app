import '../../../../app/routes/app_route.dart';
import '../../../../global/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class PreviewListingController extends GetxController {
  void finish() {
    Get.offAllNamed(AppRouteKeys.dashboard);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Get.isRegistered<BottomNavBarController>()) {
        Get.find<BottomNavBarController>().changeTab(2);
      }
    });
  }
}
