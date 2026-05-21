import 'package:get/get.dart';

class SalesAnalyticsController extends GetxController {
  var selectedTimeframe = "This year".obs;

  void updateTimeframe(String value) {
    selectedTimeframe.value = value;
  }
}
