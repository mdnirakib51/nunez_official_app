import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../app/routes/app_route.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class HomeItemCard extends StatelessWidget {
  final String? sellerName;
  final String? sellerImg;
  final String? productImg;
  final String? title;
  final String? category;
  final String? time;
  final bool isLive;
  final bool showBookmark;
  final bool isFreeShipping;

  const HomeItemCard({
    super.key,
    this.sellerName,
    this.sellerImg,
    this.productImg,
    this.title,
    this.category,
    this.time,
    this.isLive = false,
    this.showBookmark = false,
    this.isFreeShipping = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteKeys.liveVideo);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: ColorRes.grey,
                backgroundImage: NetworkImage(sellerImg ?? "https://i.pravatar.cc/150?u=1"),
              ),
              sizedBoxW(8),
              Expanded(
                child: GlobalText(
                  str: sellerName ?? "Asadur Yead",
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
                    imagePath: productImg ?? Assets.dummyImg.homeDummyImg1.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Live Badge OR Time Badge
                if (isLive)
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
                  )
                else if (time != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: GlobalText(
                        str: time!,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                // Bookmark Badge
                if (showBookmark)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bookmark,
                        color: Color(0xFFFF570D),
                        size: 16,
                      ),
                    ),
                  ),
                // Free Shipping Badge
                if (isFreeShipping)
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
          GlobalText(
            str: title ?? "500 Items Starts \$1 Electronics General Items",
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
