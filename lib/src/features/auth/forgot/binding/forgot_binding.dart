import 'package:get/get.dart';
import '../controller/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}
