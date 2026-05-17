
import 'package:get/get.dart';
import '../../../../core_functionality/constants/api_helper.dart';
import '../../../../core_functionality/network/http_client/request_handler.dart';
import '../../../../core_functionality/storage/storage_controller.dart';

class AuthRepository extends ApiHelper {
  AuthRepository() : super(
    requestHandler: Get.find<RequestHandler>(),
    storage: Get.find<LocalStorageService>(),
  );

}