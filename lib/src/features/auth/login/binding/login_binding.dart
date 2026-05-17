import 'package:get/get.dart';
import '../../domain/model/auth_model.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authRepository: Get.find<AuthRepository>()));
  }
}
