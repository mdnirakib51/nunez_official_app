import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../app/routes/app_route.dart';
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
      body: Column(
        children: [
          // Scheduled Shows Section
          Expanded(
            child: Container(
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
                  Expanded(
                    child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: controller.scheduledShows.length,
                      itemBuilder: (context, index) {
                        final show = controller.scheduledShows[index];
                        return _StreamHubItemCard(show: show);
                      },
                    )),
                  ),
                ],
              ),
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
    );
  }
}

class _StreamHubItemCard extends StatelessWidget {
  final Map<String, dynamic> show;
  const _StreamHubItemCard({required this.show});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: ColorRes.grey,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=12"),
              ),
              sizedBoxW(8),
              Expanded(
                child: GlobalText(
                  str: show['name'],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          sizedBoxH(10),
          // Product Image with Badges
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GlobalImageLoader(
                    imagePath: Assets.dummyImg.homeDummyImg1.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Date/Time Badge
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: GlobalText(
                      str: show['time'],
                      color: ColorRes.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Delete/Trash Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: ColorRes.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete_outline, size: 20, color: ColorRes.red),
                  ),
                ),
                // Free Shipping Badge
                if (show['isFreeShipping'])
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorRes.indigo.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const GlobalText(
                        str: "Free Shipping",
                        color: ColorRes.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          sizedBoxH(10),
          // Title
          GlobalText(
            str: show['title'],
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: ColorRes.white,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          sizedBoxH(4),
          // Category
          GlobalText(
            str: show['category'],
            fontSize: 11,
            color: ColorRes.green,
            fontWeight: FontWeight.w500,
          ),
          sizedBoxH(10),
          // Start Live Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4D4D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalImageLoader(
                    imagePath: Assets.appIcons.liveVideoIc.startLive.path,
                    height: 20,
                    width: 20,
                  ),
                  sizedBoxW(8),
                  const GlobalText(
                    str: "Start Live",
                    color: ColorRes.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
