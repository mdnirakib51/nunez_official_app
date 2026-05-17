import 'package:get/get.dart';
import '../../domain/model/auth_model.dart';
import '../controller/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(authRepository: Get.find<AuthRepository>()));
  }
}
