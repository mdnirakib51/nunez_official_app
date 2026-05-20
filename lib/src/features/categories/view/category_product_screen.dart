import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_route.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_sized_box.dart';
import '../../../global/global_widget/global_text.dart';
import '../../dashboard_features/home/view/widgets/home_item_card.dart';
import '../../dashboard_features/live_video/seller_profile/product_details_screen.dart';


class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedFilter = "All";
  final String categoryTitle = Get.arguments ?? "Category";

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
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorRes.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: GlobalText(
          str: categoryTitle,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRouteKeys.search),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: ColorRes.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: ColorRes.grey, size: 20),
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

          // Custom TabBar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              labelColor: ColorRes.black,
              unselectedLabelColor: ColorRes.grey,
              padding: const EdgeInsets.only(left: 15),
              indicatorColor: ColorRes.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              tabs: const [
                Tab(text: "Products"),
                Tab(text: "Shows"),
              ],
            ),
          ),
          sizedBoxH(10),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProductList(),
                _buildShowsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              _filterChip("All"),
              _filterChip("Recommended"),
              _filterChip("Auction"),
              _filterChip("Buy Now"),
            ],
          ),
        ),

        // Product List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemCount: 4,
            separatorBuilder: (context, index) => sizedBoxH(20),
            itemBuilder: (context, index) {
              final products = [
                {
                  "title": "ZaRa Original Hand bag",
                  "img": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
                  "qty": "40",
                  "status": "Brand New",
                  "price": "10.00",
                  "bids": "4 bids",
                  "type": "Buy now"
                },
                {
                  "title": "Olive Smart Watch",
                  "img": "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
                  "qty": "40",
                  "status": "Brand New",
                  "price": "10.00",
                  "bids": "4 bids",
                  "type": "Pre-Bid"
                },
                {
                  "title": "Nike Fast Sneakers",
                  "img": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
                  "qty": "40",
                  "status": "Brand New",
                  "price": "10.00",
                  "bids": "4 bids",
                  "type": "Pre-Bid"
                },
                {
                  "title": "Nikon 750D Camera",
                  "img": "https://images.unsplash.com/photo-1516035069371-29a1b244cc32",
                  "qty": "40",
                  "status": "Box open",
                  "price": "10.00",
                  "bids": "4 bids",
                  "type": "Pre-Bid"
                },
              ];

              final product = products[index];

              return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(product: {
                    "title": product["title"]!,
                    "img": product["img"]!,
                    "desc": "${product["qty"]} Available  •  ${product["status"]}",
                  }));
                },
                child: _productItem(product),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _productItem(Map<String, String> product) {
    bool isBuyNow = product["type"] == "Buy now";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product["img"]!,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
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
                fontSize: 14,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "Qty: ${product["qty"]}  •  ${product["status"]}",
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
              sizedBoxH(4),
              GlobalText(
                str: "\$${product["price"]}",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              GlobalText(
                str: product["bids"]!,
                fontSize: 12,
                color: Colors.grey,
              ),
              sizedBoxH(10),
              // Action Button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isBuyNow ? const Color(0xFF2B2B2B) : ColorRes.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: GlobalText(
                  str: product["type"]!,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: isBuyNow ? ColorRes.white : ColorRes.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShowsList() {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.50,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const HomeItemCard();
      },
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
  }
}
