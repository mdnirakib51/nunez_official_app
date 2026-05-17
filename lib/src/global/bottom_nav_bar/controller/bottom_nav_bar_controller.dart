import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../features/home/view/home_screen.dart';

// ─── Nav Item Model ───────────────────────────────────────────────────────────
class NavItemModel {
  final String title;
  final String icon;
  final String activeIcon;
  NavItemModel({required this.title, required this.icon, required this.activeIcon});
}

// ─── Bottom Nav Bar Controller ────────────────────────────────────────────────
class BottomNavBarController extends GetxController {

  // ── Nav items ──────────────────────────────────────────────────────────────
  final List<NavItemModel> navItems = [
    NavItemModel(
      title: 'Home', 
      icon: Assets.appIcons.buttomNavIc.homeIc.path,
      activeIcon: Assets.appIcons.buttomNavIc.homeActiveIc.path
    ),
    NavItemModel(
      title: 'Categories', 
      icon: Assets.appIcons.buttomNavIc.categoriesIc.path, 
      activeIcon: Assets.appIcons.buttomNavIc.categoriesActiveIc.path
    ),
    NavItemModel(
      title: '', // Middle button
      icon: '', 
      activeIcon: ''
    ),
    NavItemModel(
      title: 'Activity', 
      icon: Assets.appIcons.buttomNavIc.activityIc.path, 
      activeIcon: Assets.appIcons.buttomNavIc.activityIc.path
    ),
    NavItemModel(
      title: 'Profile', 
      icon: Assets.appIcons.buttomNavIc.profileIc.path, 
      activeIcon: Assets.appIcons.buttomNavIc.profileActiveIc.path
    ),
  ];

  // ── Screens ────────────────────────────────────────────────────────────────
  final List<Widget> screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text("Categories Screen"))),
    const SizedBox.shrink(),
    const Scaffold(body: Center(child: Text("Activity Screen"))),
    const Scaffold(body: Center(child: Text("Profile Screen"))),
  ];

  // ── Selected index (observable) ────────────────────────────────────────────
  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    if (index == 2) {
      // Handle middle button action (e.g. open camera/post modal)
      _showAddPostModal();
      return;
    }
    selectedIndex.value = index;
  }

  void _showAddPostModal() {
    Get.bottomSheet(
      Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Create New", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Create Post"),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take Photo"),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
