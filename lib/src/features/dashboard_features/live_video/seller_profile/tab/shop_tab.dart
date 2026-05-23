import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nunez_official_app/src/app/routes/app_route.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isAuction = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search shop...",
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                suffixIcon: const Icon(Icons.close, color: Colors.black, size: 20),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),

        // Toggle Buttons (Auction / Buy Now)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => isAuction = true),
                child: _toggleButton("Auction", isSelected: isAuction),
              ),
              sizedBoxW(10),
              GestureDetector(
                onTap: () => setState(() => isAuction = false),
                child: _toggleButton("Buy Now", isSelected: !isAuction),
              ),
            ],
          ),
        ),

        sizedBoxH(10),

        // Product List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => sizedBoxH(25),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final products = _getProducts();
                  Get.toNamed(AppRouteKeys.productDetails, arguments: products[index]);
                },
                child: _productItem(index),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Map<String, String>> _getProducts() {
    return [
      {
        "title": "ZaRa Original Hand bag",
        "img": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
        "desc": "40 Available  •  Brand New"
      },
      {
        "title": "Olive Smart Watch",
        "img": "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
        "desc": "40 Available  •  Brand New"
      },
      {
        "title": "Nike Fast Sneakers",
        "img": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
        "desc": "40 Available  •  Brand New"
      },
      {
        "title": "Nikon 750D Camera",
        "img": "https://images.unsplash.com/photo-1516035069371-29a1b244cc32",
        "desc": "40 Available  •  Box open"
      },
    ];
  }

  Widget _toggleButton(String text, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GlobalText(
        str: text,
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget _productItem(int index) {
    final products = _getProducts();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            products[index]["img"]!,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        sizedBoxW(15),
        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: products[index]["title"]!,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              sizedBoxH(4),
              GlobalText(
                str: products[index]["desc"]!,
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              sizedBoxH(4),
              const GlobalText(
                str: "\$10.00",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              const GlobalText(
                str: "4 bids",
                fontSize: 12,
                color: ColorRes.grey900,
                fontWeight: FontWeight.w400,
              ),
              sizedBoxH(10),
              // Pre-Bid / Add to Cart Button
              GestureDetector(
                onTap: () {
                  if (!isAuction) {
                    Get.toNamed(AppRouteKeys.cart);
                  } else {
                    Get.toNamed(AppRouteKeys.placeBid, arguments: products[index]);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: GlobalText(
                    str: isAuction ? "Pre-Bid" : "Add To Cart",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
