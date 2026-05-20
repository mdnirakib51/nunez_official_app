
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors_resources.dart';
import '../../global_widget/global_text.dart';
import '../controller/bottom_nav_bar_controller.dart';

// ─── Dashboard Bottom Navigation Bar ─────────────────────────────────────────
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavBarController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: controller.screens,
      )),
      bottomNavigationBar: _BottomNavBar(controller: controller),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller;

  const _BottomNavBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              _NavItem(index: 0, controller: controller),
              _NavItem(index: 1, controller: controller),
              const Expanded(child: SizedBox()), // Space for middle button
              _NavItem(index: 3, controller: controller),
              _NavItem(index: 4, controller: controller),
            ],
          ),
          // Middle Button
          const Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Center(
              child: _MiddleButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final BottomNavBarController controller;

  const _NavItem({required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    final item = controller.navItems[index];
    return Expanded(
      child: InkWell(
        onTap: () => controller.changeTab(index),
        child: Obx(() {
          bool isActive = controller.selectedIndex.value == index;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isActive ? item.activeIcon : item.icon,
                height: 24,
                width: 24,
                fit: BoxFit.fitHeight,
                // If the icon is not found or it's the same, we can add color filter for active state if needed
                // but user said to use image with 'active' name
              ),
              const SizedBox(height: 4),
              GlobalText(
                str: item.title,
                fontSize: 10,
                color: isActive ? Colors.black : Colors.grey,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _MiddleButton extends StatelessWidget {
  const _MiddleButton();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavBarController>();
    return GestureDetector(
      onTap: () => controller.changeTab(2),
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: ColorRes.appColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorRes.appColor,
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: -2,
            ),
          ],
        ),
        child: const Icon(
          Icons.add_circle_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
