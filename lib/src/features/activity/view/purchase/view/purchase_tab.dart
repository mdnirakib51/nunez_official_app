import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../controller/purchase_controller.dart';
import '../../../../../app/routes/app_route.dart';

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
          child: Obx(() {
            final items = controller.filteredItems;
            if (items.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(height: 40, thickness: 1),
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(AppRouteKeys.orderSummary, arguments: item),
                  behavior: HitTestBehavior.opaque,
                  child: _buildActivityItem(
                    index: index,
                    controller: controller,
                    title: item['title'],
                    subtitle: item['subtitle'],
                    price: item['price'],
                    from: item['from'],
                    date: item['date'],
                    imageUrl: item['imageUrl'],
                    status: item['status'],
                    statusColor: item['statusColor'],
                    statusTextColor: item['statusTextColor'],
                    shippingCarrier: item['shippingCarrier'],
                    trackingId: item['trackingId'],
                    rating: item['rating'],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
            sizedBoxH(20),
            const GlobalText(
              str: "No purchases found",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(10),
            GlobalText(
              str: "You haven't made any purchases in this category yet.",
              fontSize: 14,
              color: ColorRes.grey900,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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
            color: isSelected ? const Color(0xFF2B2B2B) : ColorRes.grey.withValues(alpha: 0.1),
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
    required int index,
    required PurchaseController controller,
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
    double? rating,
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
                    color: ColorRes.grey900,
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
                    color: ColorRes.grey900,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlobalText(
                        str: "Purchased: $date",
                        fontSize: 12,
                        color: ColorRes.grey900,
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
                    color: ColorRes.grey900,
                  ),
                ],
              ),
              // Buttons and Status
              Row(
                children: [
                  if (status == "Completed") ...[
                    if (rating == null)
                      GestureDetector(
                        onTap: () => _showReviewDialog(Get.context!, index, controller, imageUrl),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GlobalText(
                            str: "Review",
                            color: Colors.orange.shade700,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 12),
                            sizedBoxW(4),
                            GlobalText(
                              str: rating.toString(),
                              color: Colors.orange,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    sizedBoxW(10),
                  ],
                  _statusChip(status, statusColor, statusTextColor),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }

  void _showReviewDialog(BuildContext context, int index, PurchaseController controller, String imageUrl) {
    double selectedRating = 0;
    TextEditingController reviewController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: ColorRes.appBackColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(str: "Write a Review", fontWeight: FontWeight.bold, fontSize: 18),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),
                    sizedBoxH(20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    sizedBoxH(20),
                    const GlobalText(
                      str: "How was your experience?",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    sizedBoxH(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (starIndex) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating = starIndex + 1.0;
                            });
                          },
                          child: Icon(
                            starIndex < selectedRating ? Icons.star : Icons.star_border,
                            color: starIndex < selectedRating ? ColorRes.appColor : Colors.grey.shade400,
                            size: 30,
                          ),
                        );
                      }),
                    ),
                    sizedBoxH(20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: GlobalText(str: "Write Your Review", fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    sizedBoxH(10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: TextField(
                        controller: reviewController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: "Write here",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    sizedBoxH(25),
                    GestureDetector(
                      onTap: () {
                        if (selectedRating > 0) {
                          controller.updateRating(index, selectedRating);
                          Get.back();
                          Get.snackbar("Success", "Review submitted successfully!", 
                              backgroundColor: Colors.green, colorText: Colors.white);
                        } else {
                          Get.snackbar("Error", "Please select a rating", 
                              backgroundColor: Colors.red, colorText: Colors.white);
                        }
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade900,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Submit",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
