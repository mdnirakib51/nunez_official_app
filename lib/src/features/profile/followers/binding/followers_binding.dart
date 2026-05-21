import 'package:get/get.dart';
import '../controller/followers_controller.dart';

class FollowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowersController>(() => FollowersController());
  }
}
