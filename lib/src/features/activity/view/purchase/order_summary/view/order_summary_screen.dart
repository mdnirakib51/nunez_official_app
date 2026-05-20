
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/constants/colors_resources.dart';
import '../../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../../global/global_widget/global_text.dart';

class OrderSummaryScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const OrderSummaryScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appBackColor,
      appBar: AppBar(
        backgroundColor: ColorRes.appBackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorRes.black, size: 20),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const GlobalText(
          str: "Order Summary",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        str: item['title'] ?? "N/A",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      GlobalText(
                        str: item['subtitle'] ?? "N/A",
                        fontSize: 14,
                        color: ColorRes.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: item['statusColor'] ?? const Color(0xFFE8E1FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GlobalText(
                    str: item['status'] ?? "N/A",
                    fontSize: 12,
                    color: item['statusTextColor'] ?? const Color(0xFF7047EB),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            sizedBoxH(25),
            _buildSectionTitle("Order Details"),
            _buildDetailsCard([
              _buildDetailRow("Order Id", "#2356159", valueColor: Colors.blue),
              _buildDetailRow("Order Date", item['date'] ?? "18 Nov, 2026"),
              _buildDetailRow("Sold by", item['from'] ?? "Micheal Yead", valueColor: Colors.blue),
              _buildDetailRow("Quantity", "01"),
              _buildDetailRow("Category", "Sneakers"),
            ]),
            sizedBoxH(20),
            _buildSectionTitle("Shipping Details"),
            _buildDetailsCard([
              _buildDetailRow("Ordered by", "Asad Jamil", valueColor: Colors.blue),
              _buildDetailRow("Order Date", "18 Nov, 2026"),
              _buildDetailRow("Quantity", "01"),
              _buildDetailRow("Phone", "+12 3456 789 23", valueColor: Colors.blue),
              _buildDetailRow("Location", "Dhanmondi 32, Dhaka, Bangladesh"),
            ]),
            sizedBoxH(20),
            _buildSectionTitle("Payment Summary"),
            _buildDetailsCard([
              _buildDetailRow("${item['title'] ?? "Product"}  ✕ 1", "\$240.00"),
              _buildDetailRow("Delivery Charge", "\$20.00"),
              _buildDetailRow("Other Charge", "\$10.00"),
              _buildDetailRow("Tax", "\$10.00"),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
              _buildDetailRow("Total", "\$280.00", isBold: true),
            ]),
            sizedBoxH(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GlobalText(
                  str: "Want to cancel order?",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D4D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    elevation: 0,
                  ),
                  child: const GlobalText(
                    str: "Cancel Request",
                    color: ColorRes.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            sizedBoxH(20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlobalText(
        str: title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDetailsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: label,
            fontSize: 14,
            color: ColorRes.grey,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GlobalText(
              str: value,
              fontSize: 14,
              textAlign: TextAlign.right,
              color: valueColor ?? ColorRes.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
