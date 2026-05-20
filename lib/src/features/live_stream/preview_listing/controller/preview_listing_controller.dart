
import '../../../../app/routes/app_route.dart';
import 'package:get/get.dart';

class PreviewListingController extends GetxController {
  void finish() {
    Get.offAllNamed(AppRouteKeys.dashboard, arguments: 2);
  }
}
