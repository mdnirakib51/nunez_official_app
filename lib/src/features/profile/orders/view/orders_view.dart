import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/orders_controller.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final OrdersController controller = Get.find<OrdersController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      final filters = ["All", "Pending", "Shipped", "Delivered", "Canceled"];
      controller.updateFilter(filters[_tabController.index]);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(title: "Orders"),
      body: Column(
        children: [
          // TabBar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.grey.shade200,
              dividerHeight: 1,
              labelColor: ColorRes.black,
              unselectedLabelColor: ColorRes.grey,
              labelPadding: const EdgeInsets.only(left: 0, right: 30),
              padding: const EdgeInsets.only(left: 16),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              indicatorColor: ColorRes.black,
              indicatorSize: TabBarIndicatorSize.label,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Pending"),
                Tab(text: "Shipped"),
                Tab(text: "Delivered"),
                Tab(text: "Canceled"),
              ],
            ),
          ),

          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.filteredOrders.length,
              separatorBuilder: (context, index) => const Divider(height: 30),
              itemBuilder: (context, index) {
                final order = controller.filteredOrders[index];
                return _buildOrderItem(order);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GlobalImageLoader(
                imagePath: order['img'],
                height: 100,
                width: 110,
                fit: BoxFit.cover,
                imageFor: ImageFor.network,
              ),
            ),
            sizedBoxW(15),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: order['title'],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  sizedBoxH(4),
                  GlobalText(
                    str: "Qty: ${order['qty']}",
                    fontSize: 12,
                    color: ColorRes.grey900,
                  ),
                  sizedBoxH(4),
                  Row(
                    children: [
                      const GlobalText(
                        str: "Order Id: ",
                        fontSize: 12,
                        color: ColorRes.grey900,
                      ),
                      GlobalText(
                        str: order['orderId'],
                        fontSize: 12,
                        color: ColorRes.green,
                      ),
                      sizedBoxW(5),
                      const Icon(Icons.copy, size: 12, color: ColorRes.green),
                    ],
                  ),
                  sizedBoxH(15),
                  GlobalText(
                    str: "\$${order['price'].toStringAsFixed(2)}",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        sizedBoxH(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: order['status'],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                GlobalText(
                  str: order['hasTracking'] ? "Tracking Id: ${order['trackingId']}" : order['time'],
                  fontSize: 12,
                  color: ColorRes.grey900,
                ),
              ],
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  if (!order['hasTracking']) {
                    _showTrackingBottomSheet();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: order['hasTracking'] ? const Color(0xFF42D06B) : ColorRes.appButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 0,
                ),
                child: GlobalText(
                  str: order['hasTracking'] ? "Manage" : "Add Tracking",
                  color: ColorRes.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showTrackingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GlobalText(
                      str: "Tracking Details",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                sizedBoxH(20),
                const GlobalText(str: "Carrier", fontSize: 14, fontWeight: FontWeight.w500),
                sizedBoxH(8),
                _buildTextField("Fedex"),
                sizedBoxH(20),
                const GlobalText(str: "Tracking Id", fontSize: 14, fontWeight: FontWeight.w500),
                sizedBoxH(8),
                _buildTextField("123456789"),
                sizedBoxH(25),
                const GlobalText(str: "Quick Status Update", fontSize: 14, fontWeight: FontWeight.w500),
                sizedBoxH(15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _statusChip("Shipped"),
                    _statusChip("In Transit", isSelected: true),
                    _statusChip("Out for Delivery"),
                    _statusChip("Delivered"),
                  ],
                ),
                sizedBoxH(25),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Color(0xFF3268D7), size: 20),
                      sizedBoxW(10),
                      const Expanded(
                        child: GlobalText(
                          str: "Changing the status to \"Out for Delivery\" will trigger an automated SMS notification to the customer.",
                          fontSize: 12,
                          color: Color(0xFF3268D7),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxH(30),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRes.appButtonColor,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const GlobalText(
                    str: "Submit",
                    color: ColorRes.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxH(10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: ColorRes.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _statusChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF42D06B) : ColorRes.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
      ),
      child: GlobalText(
        str: label,
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        color: isSelected ? ColorRes.white : ColorRes.black,
      ),
    );
  }
}
