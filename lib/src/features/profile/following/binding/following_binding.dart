import 'package:get/get.dart';
import '../controller/following_controller.dart';

class FollowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowingController>(() => FollowingController());
  }
}
