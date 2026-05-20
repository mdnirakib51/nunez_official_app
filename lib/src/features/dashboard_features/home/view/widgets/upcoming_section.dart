import 'package:flutter/material.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class UpcomingSection extends StatelessWidget {
  final String title;
  const UpcomingSection({super.key, this.title = "Upcoming Toys & Hobbies"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF6E6E6E),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalText(
                  str: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.white,
                ),
                Row(
                  children: [
                    const GlobalText(
                      str: "Show All",
                      fontSize: 14,
                      color: ColorRes.white,
                    ),
                    sizedBoxW(5),
                    const Icon(Icons.arrow_forward_ios, size: 12, color: ColorRes.white),
                  ],
                ),
              ],
            ),
          ),
          sizedBoxH(15),
          SizedBox(
            height: 330, // Height for horizontal cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const UpcomingItemCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingItemCard extends StatelessWidget {
  const UpcomingItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundColor: ColorRes.grey,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=12"),
              ),
              sizedBoxW(6),
              const Expanded(
                child: GlobalText(
                  str: "Asadur Yead",
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.white,
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
                // Date/Time Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const GlobalText(
                      str: "Tomorrow,\n10:30 PM",
                      color: ColorRes.black,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Bookmark Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: ColorRes.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bookmark_border, size: 16, color: ColorRes.black),
                  ),
                ),
                // Free Shipping Badge
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorRes.indigo.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const GlobalText(
                      str: "Free Shipping",
                      color: ColorRes.white,
                      fontSize: 9,
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
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ColorRes.white,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          sizedBoxH(4),
          // Category
          const GlobalText(
            str: "Electronics",
            fontSize: 10,
            color: ColorRes.green,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
