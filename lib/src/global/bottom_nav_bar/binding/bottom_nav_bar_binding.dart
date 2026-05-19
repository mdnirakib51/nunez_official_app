
import 'package:get/get.dart';
import '../../../features/dashboard_features/home/controller/home_controller.dart';
import '../../../features/dashboard_features/live_stream/steam_hub/controller/stream_hub_controller.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<StreamHubController>(() => StreamHubController());
  }
}
