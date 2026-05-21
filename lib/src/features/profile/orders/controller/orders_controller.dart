import 'package:get/get.dart';

class OrdersController extends GetxController {
  var selectedFilter = "All".obs;

  var orders = <Map<String, dynamic>>[
    {
      "id": "1",
      "title": "Pure Solution Essence",
      "qty": "01",
      "orderId": "#123456",
      "price": 10.00,
      "status": "Ordered",
      "time": "2 hours ago",
      "img": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "hasTracking": false,
    },
    {
      "id": "2",
      "title": "Pure Solution Essence",
      "qty": "01",
      "orderId": "#123456",
      "price": 10.00,
      "status": "Fedex",
      "trackingId": "123456789",
      "img": "https://images.unsplash.com/photo-1556228720-195a672e8a03",
      "hasTracking": true,
    },
  ].obs;

  List<Map<String, dynamic>> get filteredOrders {
    if (selectedFilter.value == "All") return orders;
    return orders.where((order) {
      if (selectedFilter.value == "Pending") return order['status'] == "Ordered";
      if (selectedFilter.value == "Shipped") return order['status'] == "Fedex";
      return false;
    }).toList();
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
