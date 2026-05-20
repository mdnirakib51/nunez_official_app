import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const GlobalText(
          str: "Stream Hub",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.find<BottomNavBarController>().changeTab(0),
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
                    height: 410, // Fixed height for horizontal list
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
                              onDelete: () {
                                // Add delete logic if needed
                              },
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

            // Create Listing Button
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRouteKeys.createListing);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF252525),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, color: ColorRes.white, size: 24),
                      sizedBoxW(10),
                      const GlobalText(
                        str: "Create Listing",
                        color: ColorRes.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedBoxH(MediaQuery.of(context).padding.bottom + 20),
          ],
        ),
      ),
    );
  }
}
