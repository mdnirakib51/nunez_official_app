import 'package:flutter/material.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../widgets/home_item_card.dart';

class ToysHobbiesTab extends StatelessWidget {
  const ToysHobbiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH(15),
          // Featured Horizontal List (e.g., Funko, Bearbrick)
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 4,
              itemBuilder: (context, index) {
                final titles = ["Funko", "Bearbrick", "Disney", "Others"];
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        GlobalImageLoader(
                          imagePath: Assets.dummyImg.homeDummyImg2.path,
                          height: 80,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                        // Dark Overlay for readability
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.3),
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.5),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlobalText(
                                str: titles[index % titles.length],
                                color: ColorRes.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.bar_chart, color: ColorRes.white, size: 10),
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          sizedBoxH(20),
          // Filter Chips & Sort Icon Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _showSortBottomSheet(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorRes.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.swap_vert, size: 20, color: ColorRes.black),
                  ),
                ),
                sizedBoxW(10),
                _filterChip("Recommended", isSelected: true),
                _filterChip("Top Seller"),
                _filterChip("New and Note..."),
              ],
            ),
          ),
          sizedBoxH(10),
          // Product Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.50,
            ),
            itemCount: 6, // Dummy count
            itemBuilder: (context, index) {
              return const HomeItemCard(category: "Toys & Hobbies");
            },
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ColorRes.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GlobalText(
        str: label,
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: ColorRes.black,
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorRes.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: ColorRes.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              sizedBoxH(20),
              const GlobalText(
                str: "Sort",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              sizedBoxH(15),
              const Divider(thickness: 1),
              _sortOption("Recommended", isSelected: true, onTap: () => Navigator.pop(context)),
              _sortOption("New and Noteworthy", onTap: () => Navigator.pop(context)),
              _sortOption("Top Sellers", onTap: () => Navigator.pop(context)),
              _sortOption("High to Low", onTap: () => Navigator.pop(context)),
              _sortOption("Low to high", onTap: () => Navigator.pop(context)),
              sizedBoxH(10),
            ],
          ),
        );
      },
    );
  }

  Widget _sortOption(String title, {bool isSelected = false, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      title: GlobalText(
        str: title,
        fontSize: 16,
        fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
        color: ColorRes.black,
      ),
      trailing: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? ColorRes.black : ColorRes.grey,
            width: isSelected ? 6 : 1.5,
          ),
        ),
      ),
    );
  }
}
