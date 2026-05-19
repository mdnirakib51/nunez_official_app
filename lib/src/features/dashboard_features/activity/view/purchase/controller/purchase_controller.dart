import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  var selectedFilter = "All".obs;

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }

  var purchaseItems = <Map<String, dynamic>>[
    {
      "title": "Nike Running Shoes",
      "subtitle": "Brand New",
      "price": "10.00",
      "from": "Micheal Yead",
      "date": "Nov 12, 2026",
      "imageUrl": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "status": "In Progress",
      "statusColor": const Color(0xFFE8E1FF),
      "statusTextColor": const Color(0xFF7047EB),
    },
    {
      "title": "Pure Solution Essence",
      "subtitle": "Brand New",
      "price": "10.00",
      "from": "Micheal Yead",
      "date": "Nov 12, 2026",
      "imageUrl": "https://images.unsplash.com/photo-1556228720-195a672e8a03",
      "status": "Shipped",
      "statusColor": const Color(0xFFD6F0FF),
      "statusTextColor": const Color(0xFF0095FF),
      "shippingCarrier": "Fedex",
      "trackingId": "123456789",
    },
    {
      "title": "Fuji-film 600D Camera",
      "subtitle": "Brand New",
      "price": "10.00",
      "from": "Micheal Yead",
      "date": "Nov 12, 2026",
      "imageUrl": "https://images.unsplash.com/photo-1516035069371-29a1b244cc32",
      "status": "Completed",
      "statusColor": const Color(0xFFE2FBEA),
      "statusTextColor": const Color(0xFF27AE60),
      "shippingCarrier": "Fedex",
      "trackingId": "123456789",
    },
  ].obs;

  List<Map<String, dynamic>> get filteredItems {
    if (selectedFilter.value == "All") {
      return purchaseItems;
    }
    return purchaseItems.where((item) => item['status'].toString().toLowerCase() == selectedFilter.value.toLowerCase()).toList();
  }
}
