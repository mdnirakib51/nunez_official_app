import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../../../live_video/live_video_view/live_video_screen.dart';

class HomeItemCard extends StatelessWidget {
  final String? category;
  const HomeItemCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const LiveVideoScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: ColorRes.grey,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=1"),
              ),
              sizedBoxW(8),
              const Expanded(
                child: GlobalText(
                  str: "Asadur Yead",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          sizedBoxH(8),
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
                // Live Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const GlobalText(
                      str: "Live • 84",
                      color: ColorRes.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Free Shipping Badge
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorRes.indigo.withValues(alpha: 0.8),
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
          sizedBoxH(8),
          // Title
          const GlobalText(
            str: "500 Items Starts \$1 Electronics General Items",
            fontSize: 13,
            fontWeight: FontWeight.w600,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          sizedBoxH(4),
          // Category
          GlobalText(
            str: category ?? "Toys & Hobbies",
            fontSize: 11,
            color: ColorRes.green,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
