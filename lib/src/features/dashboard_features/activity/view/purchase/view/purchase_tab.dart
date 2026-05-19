import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/constants/colors_resources.dart';
import '../../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../../global/global_widget/global_text.dart';
import '../controller/purchase_controller.dart';

class PurchaseTab extends StatelessWidget {
  const PurchaseTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PurchaseController());

    return Column(
      children: [
        sizedBoxH(15),
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              _filterChip("All", controller),
              _filterChip("In progress", controller),
              _filterChip("Completed", controller),
              _filterChip("Returned", controller),
              _filterChip("Cancelled", controller),
            ],
          ),
        ),
        sizedBoxH(15),
        // Activity List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              _buildActivityItem(
                title: "Nike Running Shoes",
                subtitle: "Brand New",
                price: "10.00",
                from: "Micheal Yead",
                date: "Nov 12, 2026",
                imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                status: "In Progress",
                statusColor: const Color(0xFFE8E1FF),
                statusTextColor: const Color(0xFF7047EB),
              ),
              const Divider(height: 40, thickness: 1),
              _buildActivityItem(
                title: "Pure Solution Essence",
                subtitle: "Brand New",
                price: "10.00",
                from: "Micheal Yead",
                date: "Nov 12, 2026",
                imageUrl: "https://images.unsplash.com/photo-1556228720-195a672e8a03",
                status: "Shipped",
                statusColor: const Color(0xFFD6F0FF),
                statusTextColor: const Color(0xFF0095FF),
                shippingCarrier: "Fedex",
                trackingId: "123456789",
              ),
              const Divider(height: 40, thickness: 1),
              _buildActivityItem(
                title: "Fuji-film 600D Camera",
                subtitle: "Brand New",
                price: "10.00",
                from: "Micheal Yead",
                date: "Nov 12, 2026",
                imageUrl: "https://images.unsplash.com/photo-1516035069371-29a1b244cc32",
                status: "Completed",
                statusColor: const Color(0xFFE2FBEA),
                statusTextColor: const Color(0xFF27AE60),
                shippingCarrier: "Fedex",
                trackingId: "123456789",
              ),
              sizedBoxH(20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterChip(String label, PurchaseController controller) {
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

  Widget _buildActivityItem({
    required String title,
    required String subtitle,
    required String price,
    required String from,
    required String date,
    required String imageUrl,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    String? shippingCarrier,
    String? trackingId,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 110,
                  width: 110,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            sizedBoxW(15),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: title,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  sizedBoxH(2),
                  GlobalText(
                    str: subtitle,
                    fontSize: 13,
                    color: ColorRes.grey,
                  ),
                  sizedBoxH(4),
                  GlobalText(
                    str: "\$$price",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  sizedBoxH(2),
                  GlobalText(
                    str: "From $from",
                    fontSize: 13,
                    color: ColorRes.grey,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlobalText(
                        str: "Purchased: $date",
                        fontSize: 12,
                        color: ColorRes.grey,
                      ),
                      if (shippingCarrier == null)
                        _statusChip(status, statusColor, statusTextColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        if (shippingCarrier != null) ...[
          sizedBoxH(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: shippingCarrier,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  GlobalText(
                    str: "Tracking Id: $trackingId",
                    fontSize: 12,
                    color: ColorRes.grey,
                  ),
                ],
              ),
              // Status Chip (Bottom right for Shipped/Completed)
              _statusChip(status, statusColor, statusTextColor),
            ],
          ),
        ],
      ],
    );
  }

  Widget _statusChip(String status, Color color, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GlobalText(
        str: status,
        color: textColor,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
