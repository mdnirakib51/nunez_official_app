import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/following_controller.dart';

class FollowingView extends GetView<FollowingController> {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Following",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: ColorRes.grey, fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: ColorRes.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          sizedBoxH(10),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GlobalText(
              str: "Followers (${controller.followingList.length})",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),

          sizedBoxH(10),

          // List
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: controller.followingList.length,
              separatorBuilder: (context, index) => sizedBoxH(20),
              itemBuilder: (context, index) {
                final item = controller.followingList[index];
                return Row(
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(item['image']!),
                      backgroundColor: ColorRes.grey200,
                    ),
                    sizedBoxW(15),
                    
                    // Name and Followers
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalText(
                            str: item['name']!,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 2),
                          GlobalText(
                            str: item['followers']!,
                            fontSize: 12,
                            color: ColorRes.grey,
                          ),
                        ],
                      ),
                    ),

                    // More Icon
                    const Icon(Icons.more_vert, color: ColorRes.black),
                  ],
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
