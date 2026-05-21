import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../cart/view/cart_screen.dart';
import 'place_bid_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: Image.network(
                    product["img"]!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: context.mediaQueryPadding.top + 10,
                  left: 15,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      sizedBoxW(5),
                      CircleAvatar(radius: 3, backgroundColor: Colors.white.withValues(alpha: 0.5)),
                      sizedBoxW(5),
                      CircleAvatar(radius: 3, backgroundColor: Colors.white.withValues(alpha: 0.5)),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: product["title"]!,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  sizedBoxH(8),
                  GlobalText(
                    str: product["desc"]!,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  sizedBoxH(10),
                  const Row(
                    children: [
                      GlobalText(str: "Starting at ", fontSize: 14, color: Colors.grey),
                      GlobalText(str: "\$10", fontSize: 16, fontWeight: FontWeight.bold),
                      GlobalText(str: " + Shipping +Taxes", fontSize: 14, color: Colors.grey),
                    ],
                  ),

                  sizedBoxH(20),
                  const Divider(),
                  sizedBoxH(10),

                  Row(
                    children: [
                      Expanded(
                        child: _actionButton(Icons.bookmark_border, "10"),
                      ),
                      sizedBoxW(15),
                      Expanded(
                        child: _actionButton(Icons.ios_share, "Share"),
                      ),
                    ],
                  ),

                  sizedBoxH(25),

                  // Seller Info Card
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=micheal"),
                              ),
                              sizedBoxW(10),
                              const Expanded(
                                child: GlobalText(
                                  str: "Micheal Thomas",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: ColorRes.black,
                                  shape: BoxShape.circle,
                                ),
                                child: GlobalImageLoader(
                                  imagePath: Assets.appIcons.liveVideoIc.messageIc.path,
                                  height: 16,
                                  width: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Stats
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              _statItem("4.9", "Rating", icon: Icons.star),
                              _divider(),
                              _statItem("1.1k", "Reviews"),
                              _divider(),
                              _statItem("12k", "Sold"),
                              _divider(),
                              _statItem("Avg 2d", "Ship Time"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  sizedBoxH(25),

                  const GlobalText(str: "Description", fontWeight: FontWeight.bold, fontSize: 16),
                  sizedBoxH(10),
                  const GlobalText(
                    str: "Lorem is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    fontSize: 14,
                    color: Colors.grey,
                  ),

                  sizedBoxH(25),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        GlobalText(str: "Category", fontWeight: FontWeight.bold),
                        Spacer(),
                        GlobalText(str: "Ladies Bag", color: Colors.grey),
                      ],
                    ),
                  ),

                  sizedBoxH(25),

                  const GlobalText(str: "Reviews", fontWeight: FontWeight.bold, fontSize: 16),
                  sizedBoxH(15),

                  // Review Item (Copied from ReviewsTab)
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 18, backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=irfan")),
                            sizedBoxW(10),
                            const Expanded(child: GlobalText(str: "Irfan Haider", fontWeight: FontWeight.bold)),
                            const GlobalText(str: "02/06/2026", color: Colors.grey, fontSize: 11),
                          ],
                        ),
                        sizedBoxH(10),
                        const Row(
                          children: [
                            GlobalText(str: "4.9 ", fontWeight: FontWeight.bold),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                          ],
                        ),
                        sizedBoxH(8),
                        const GlobalText(str: "Great Product and Fast Delivery. Thanks", fontSize: 13),
                        sizedBoxH(12),
                        Row(
                          children: [
                            _reviewImage("https://images.unsplash.com/photo-1434389677669-e08b4cac3105"),
                            sizedBoxW(10),
                            _reviewImage("https://images.unsplash.com/photo-1523381210434-271e8be1f52b"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  sizedBoxH(20),
                  Row(
                    children: [
                      const GlobalText(str: "Created on: 02/06/26", color: Colors.grey, fontSize: 13),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const GlobalText(str: "Report listing", color: Colors.red, fontSize: 13),
                      ),
                    ],
                  ),

                  sizedBoxH(10),

                  GestureDetector(
                    onTap: () => Get.to(() => const CartScreen()),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const GlobalText(str: "Add To Cart", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  sizedBoxH(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, height: 70, width: 70, fit: BoxFit.cover),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          sizedBoxW(8),
          GlobalText(str: label, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, {IconData? icon}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, size: 16, color: Colors.black),
              GlobalText(str: " $value", fontWeight: FontWeight.bold, fontSize: 14),
            ],
          ),
          sizedBoxH(4),
          GlobalText(str: label, fontSize: 12, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _divider() => Container(height: 30, width: 1, color: Colors.grey.shade200);
}
