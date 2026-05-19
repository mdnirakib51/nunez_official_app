import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        title: const GlobalText(
          str: "Categories",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.search),
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
                        child: GlobalText(
                          str: "Search shop...",
                          fontSize: 14,
                          color: ColorRes.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedBoxH(20),

            // Browse Category Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GlobalText(
                str: "Browse Category",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBoxH(15),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  _filterChip("All"),
                  _filterChip("Recommended"),
                  _filterChip("Popular"),
                ],
              ),
            ),
            sizedBoxH(20),

            // Categories List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 6,
              itemBuilder: (context, index) {
                final categories = [
                  {"title": "Man's Clothing", "image": Assets.dummyImg.homeDummyImg2.path},
                  {"title": "Mobile & Gadget", "image": Assets.dummyImg.homeDummyImg2.path},
                  {"title": "Shoes & Sneaker's", "image": Assets.dummyImg.homeDummyImg2.path},
                  {"title": "Women's Clothing", "image": Assets.dummyImg.homeDummyImg2.path},
                  {"title": "Women's Clothing", "image": Assets.dummyImg.homeDummyImg2.path},
                  {"title": "Women's Bag", "image": Assets.dummyImg.homeDummyImg2.path},
                ];

                final category = categories[index % categories.length];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteKeys.categoryProduct, arguments: category["title"]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ColorRes.appColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: GlobalImageLoader(
                            imagePath: category["image"] as String,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        sizedBoxW(15),
                        // Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalText(
                                str: category["title"] as String,
                                color: ColorRes.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              sizedBoxH(6),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.bar_chart, color: ColorRes.white, size: 12),
                                  ),
                                  sizedBoxW(5),
                                  const GlobalText(
                                    str: "1k Viewers",
                                    color: ColorRes.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: ColorRes.white, size: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
            sizedBoxH(20),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2B2B2B) : ColorRes.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GlobalText(
          str: label,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? ColorRes.white : ColorRes.black,
        ),
      ),
    );
  }
}
