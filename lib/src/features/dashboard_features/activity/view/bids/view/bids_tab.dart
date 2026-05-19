import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../../global/constants/colors_resources.dart';
import '../../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../../global/global_widget/global_text.dart';
import '../controller/bids_controller.dart';

class BidsTab extends StatelessWidget {
  const BidsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BidsController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxH(15),
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              _filterChip("All", controller),
              _filterChip("Outbid", controller),
              _filterChip("Winnings", controller),
            ],
          ),
        ),
        sizedBoxH(15),
        // Bids Content
        Expanded(
          child: Obx(() {
            if (controller.selectedFilter.value == "All") {
              final allItems = [...controller.outbidItems, ...controller.winningItems];
              if (allItems.isEmpty) {
                return _buildEmptyState();
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: allItems.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => sizedBoxH(25),
                itemBuilder: (context, index) {
                  final item = allItems[index];
                  bool isWinning = controller.winningItems.contains(item);
                  return _buildBidItem(
                    title: item['title'],
                    qty: item['qty'],
                    condition: item['condition'],
                    price: item['price'],
                    date: item['date'],
                    statusMessage: item['statusMessage'],
                    statusColor: isWinning ? const Color(0xFF27AE60) : const Color(0xFFFF7A45),
                    imageUrl: item['imageUrl'],
                    bottomActionText: item['bottomActionText'],
                    isWinning: isWinning,
                  );
                },
              );
            } else if (controller.selectedFilter.value == "Outbid") {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: controller.outbidItems.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => sizedBoxH(25),
                itemBuilder: (context, index) {
                  final item = controller.outbidItems[index];
                  return _buildBidItem(
                    title: item['title'],
                    qty: item['qty'],
                    condition: item['condition'],
                    price: item['price'],
                    statusMessage: item['statusMessage'],
                    statusColor: const Color(0xFFFF7A45),
                    imageUrl: item['imageUrl'],
                    bottomActionText: item['bottomActionText'],
                  );
                },
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: controller.winningItems.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => sizedBoxH(25),
                itemBuilder: (context, index) {
                  final item = controller.winningItems[index];
                  return _buildBidItem(
                    title: item['title'],
                    qty: item['qty'],
                    condition: item['condition'],
                    price: item['price'],
                    date: item['date'],
                    statusMessage: item['statusMessage'],
                    statusColor: const Color(0xFF27AE60),
                    imageUrl: item['imageUrl'],
                    isWinning: true,
                  );
                },
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _filterChip(String label, BidsController controller) {
    return Obx(() {
      bool isSelected = controller.selectedFilter.value == label;
      return GestureDetector(
        onTap: () {
          controller.updateFilter(label);
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
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBoxH(80),
            GlobalImageLoader(
              imagePath: Assets.appIcons.bidsLogoIc.path,
              height: 56,
              width: 56,
            ),
            sizedBoxH(20),
            const GlobalText(
              str: "You have no active bid",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(10),
            GlobalText(
              str: "Browse your favorite categories auctions to place a bid",
              fontSize: 14,
              color: ColorRes.grey,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B2B2B),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const GlobalText(
                str: "Browse Shows",
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBidItem({
    required String title,
    required int qty,
    required String condition,
    required String price,
    String? date,
    required String statusMessage,
    required Color statusColor,
    required String imageUrl,
    String? bottomActionText,
    bool isWinning = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        sizedBoxW(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: title,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "Qty: $qty • $condition",
                fontSize: 12,
                color: ColorRes.grey,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "\$$price",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              if (date != null) ...[
                sizedBoxH(4),
                GlobalText(
                  str: "Date: $date",
                  fontSize: 12,
                  color: ColorRes.grey,
                ),
              ],
              sizedBoxH(8),
              GlobalText(
                str: statusMessage,
                fontSize: 13,
                color: statusColor,
                fontWeight: isWinning ? FontWeight.w500 : FontWeight.w400,
              ),
              if (bottomActionText != null) ...[
                sizedBoxH(10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorRes.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: GlobalText(
                      str: bottomActionText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
