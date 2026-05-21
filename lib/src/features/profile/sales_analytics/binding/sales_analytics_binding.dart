import 'package:get/get.dart';
import '../controller/sales_analytics_controller.dart';

class SalesAnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesAnalyticsController>(() => SalesAnalyticsController());
  }
}
