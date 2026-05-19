import 'package:get/get.dart';
import '../controller/stream_hub_controller.dart';

class StreamHubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamHubController>(() => StreamHubController());
  }
}
