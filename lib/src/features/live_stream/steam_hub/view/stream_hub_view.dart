import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../app/routes/app_route.dart';
import '../../../dashboard_features/home/view/widgets/home_item_card.dart';
import '../../../../global/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import '../controller/stream_hub_controller.dart';

class StreamHubView extends GetView<StreamHubController> {
  const StreamHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: Get.arguments == true ? "Shows" : "Stream Hub",
        isBackIc: Get.arguments == true,
        actions: [
          IconButton(
            onPressed: () => Get.arguments == true
                ? Get.back()
                : Get.find<BottomNavBarController>().changeTab(0),
            icon: const Icon(Icons.close, color: ColorRes.black),
          ),
          sizedBoxW(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scheduled Shows Section
            Container(
              width: double.infinity,
              color: const Color(0xFF6E6E6E),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: GlobalText(
                      str: "Scheduled Shows",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.white,
                    ),
                  ),
                  sizedBoxH(15),
                  SizedBox(
                    height: 410,
                    child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: controller.scheduledShows.length,
                      itemBuilder: (context, index) {
                        final show = controller.scheduledShows[index];
                        return SizedBox(
                          width: 190,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: HomeItemCard(
                              isStreamHub: true,
                              sellerName: show['name'],
                              time: show['time'],
                              isFreeShipping: show['isFreeShipping'] ?? false,
                              title: show['title'],
                              category: show['category'],
                              onDelete: () {},
                              onStartLive: () {
                                Get.toNamed(AppRouteKeys.liveStream);
                              },
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                ],
              ),
            ),

            // Create New Show Button (Visible when NOT coming from Profile)
            if (Get.arguments != true)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: InkWell(
                  onTap: () => Get.toNamed(AppRouteKeys.createListing),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B2B2B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: ColorRes.white, size: 24),
                        sizedBoxW(10),
                        const GlobalText(
                          str: "Create New Show",
                          color: ColorRes.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Past Shows Section (Visible when coming from Profile)
            if (Get.arguments == true) ...[
              sizedBoxH(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: "Past Shows",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(() => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.50,
                    ),
                    itemCount: controller.pastShows.length,
                    itemBuilder: (context, index) {
                      final show = controller.pastShows[index];
                      return HomeItemCard(
                        sellerName: show['name'],
                        title: show['title'],
                        category: show['category'],
                        time: show['time'],
                        isFreeShipping: show['isFreeShipping'] ?? false,
                        isStreamHub: true,
                        textColor: ColorRes.black,
                        onDelete: () {},
                      );
                    },
                  )),
            ],
            sizedBoxH(100), // Space for bottom
          ],
        ),
      ),
      floatingActionButton: Get.arguments == true
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(AppRouteKeys.createListing),
              backgroundColor: ColorRes.appButtonColor,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: ColorRes.white, size: 30),
            )
          : null,
    );
  }
}
