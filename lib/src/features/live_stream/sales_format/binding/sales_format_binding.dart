import 'package:get/get.dart';
import '../controller/sales_format_controller.dart';

class SalesFormatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesFormatController>(
      () => SalesFormatController(),
    );
  }
}
