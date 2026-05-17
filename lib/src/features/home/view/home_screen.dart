import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_image_loader.dart';
import '../../../global/global_widget/global_sized_box.dart';
import '../../../global/global_widget/global_text.dart';
import '../controller/home_controller.dart';
import 'tab/for_you_tab.dart';
import 'tab/toys_hobbies_tab.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            // Search Bar
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: ColorRes.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: Assets.appIcons.searchIc.path,
                      height: 20,
                      width: 20,
                      color: ColorRes.grey,
                    ),
                    sizedBoxW(10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: ColorRes.grey, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxW(15),
            // Notification Icon
            GlobalImageLoader(
              imagePath: Assets.appIcons.notificationIc.path,
              height: 24,
              width: 24,
            ),
            sizedBoxW(15),
            // Cart Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: ColorRes.appColor,
                shape: BoxShape.circle,
              ),
              child: GlobalImageLoader(
                imagePath: Assets.appIcons.cartIc.path,
                height: 20,
                width: 20,
                color: ColorRes.white,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: controller.tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          labelColor: ColorRes.black,
          unselectedLabelColor: ColorRes.grey,
          labelPadding: const EdgeInsets.only(left: 0, right: 20),
          padding: const EdgeInsets.only(left: 16),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          indicatorColor: ColorRes.black,
          indicatorSize: TabBarIndicatorSize.label,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
          tabs: controller.categories.map((category) => Tab(text: category)).toList(),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          const ForYouTab(),
          const ForYouTab(),
          const Center(child: Text("Electronics")),
          const Center(child: Text("Video Games")),
          const Center(child: Text("Fashion")),
        ],
      ),
    );
  }
}
