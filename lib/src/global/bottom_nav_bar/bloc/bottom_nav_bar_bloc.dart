import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ─── Nav Item Model ───────────────────────────────────────────────────────────
class NavItemModel {
  final String title;
  final IconData icon;
  NavItemModel({required this.title, required this.icon});
}

// ─── Bottom Nav Bar Controller ────────────────────────────────────────────────
class BottomNavBarController extends GetxController {

  // ── Nav items ──────────────────────────────────────────────────────────────
  final List<NavItemModel> navItems = [
    NavItemModel(title: 'Address', icon: Icons.location_on_rounded),
    NavItemModel(title: 'Profile', icon: Icons.person_rounded),
  ];

  // ── Screens ────────────────────────────────────────────────────────────────
  final List<Widget> screens = [
    // AddressScreen(),
    // const ProfileMenuScreen(),
  ];

  // ── Selected index (observable) ────────────────────────────────────────────
  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;
  }
}