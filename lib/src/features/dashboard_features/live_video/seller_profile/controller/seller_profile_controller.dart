import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> tabs = [
    "Shop",
    "Shows",
    "Reviews",
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
