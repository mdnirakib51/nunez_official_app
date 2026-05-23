import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/home_controller.dart';
import 'tab/electronics_tab.dart';
import 'tab/fashion_tab.dart';
import 'tab/for_you_tab.dart';
import 'tab/toys_hobbies_tab.dart';
import 'tab/video_games_tab.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        backgroundColor: ColorRes.white,
        appBar: AppBar(
          backgroundColor: ColorRes.white,
          elevation: 0,
          toolbarHeight: 80,
          title: Row(
            children: [
              // Search Bar
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRouteKeys.search),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorRes.grey.withValues(alpha: 0.1),
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
                          child: GlobalText(
                            str: "Search",
                            fontSize: 14,
                            color: ColorRes.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizedBoxW(15),
              // Notification Icon
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.notification),
                child: GlobalImageLoader(
                  imagePath: Assets.appIcons.notificationIc.path,
                  height: 24,
                  width: 24,
                ),
              ),
              sizedBoxW(15),
              // Cart Icon
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.cart),
                child: Container(
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
              ),
            ],
          ),
          bottom: TabBar(
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
        body: const TabBarView(
          children: [
            ForYouTab(),
            ToysHobbiesTab(),
            ElectronicsTab(),
            VideoGamesTab(),
            FashionTab(),
          ],
        ),
      ),
    );
  }
}
