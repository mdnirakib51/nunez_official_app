
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/inventory_controller.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final InventoryController controller = Get.put(InventoryController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: GlobalAppBar(
        title: AppStrings.inventoryTitle,
      ),
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
                Tab(text: AppStrings.auction),
                Tab(text: AppStrings.buyNow),
              ],
            ),
          ),
          
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProductList(),
                _buildProductList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRouteKeys.createProductListing),
        backgroundColor: ColorRes.appButtonColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: ColorRes.white, size: 30),
      ),
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        // Filter Chips & Search
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  _filterChip(AppStrings.active),
                  sizedBoxW(10),
                  _filterChip(AppStrings.inactive),
                ],
              ),
              sizedBoxH(15),
              // Search Bar
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: ColorRes.grey, size: 22),
                    sizedBoxW(10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.searchProduct,
                          hintStyle: TextStyle(color: ColorRes.grey, fontSize: 14),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Product List
        Expanded(
          child: Obx(() => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: controller.products.length,
            separatorBuilder: (context, index) => sizedBoxH(15),
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return _inventoryItem(product);
            },
          )),
        ),
      ],
    );
  }

  Widget _inventoryItem(Map<String, String> product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GlobalImageLoader(
            imagePath: product["img"]!,
            height: 120,
            width: 120,
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
                str: product["title"]!,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "Qty: ${product["qty"]}  •  ${product["status"]}",
                fontSize: 12,
                color: ColorRes.grey,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "\$${product["price"]}",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              sizedBoxH(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.edit_outlined, size: 16),
                          sizedBoxW(5),
                          const GlobalText(
                            str: AppStrings.edit,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxW(10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterChip(String label) {
    return Obx(() {
      bool isSelected = controller.selectedFilter.value == label;
      return GestureDetector(
        onTap: () => controller.changeFilter(label),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2B2B2B) : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GlobalText(
            str: label,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? ColorRes.white : ColorRes.black,
          ),
        ),
      );
    });
  }
}
