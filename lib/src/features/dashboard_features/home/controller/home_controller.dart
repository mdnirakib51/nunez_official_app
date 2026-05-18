import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> categories = [
    "For You",
    "Toys & Hobbies",
    "Electronics",
    "Video Games",
    "Fashion",
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
