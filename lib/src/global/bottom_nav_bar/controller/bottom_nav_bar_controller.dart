
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../features/activity/view/activity_screen.dart';
import '../../../features/categories/view/categories_screen.dart';
import '../../../features/dashboard_features/home/view/home_screen.dart';
import '../../../features/live_stream/steam_hub/view/stream_hub_view.dart';

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
    const CategoriesScreen(),
    const StreamHubView(),
    const ActivityScreen(),
    const Scaffold(body: Center(child: Text("Profile Screen"))),
  ];

  // ── Selected index (observable) ────────────────────────────────────────────
  final RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
