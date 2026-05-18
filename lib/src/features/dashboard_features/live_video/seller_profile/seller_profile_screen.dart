import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import 'controller/seller_profile_controller.dart';
import 'tab/reviews_tab.dart';
import 'tab/shop_tab.dart';
import 'tab/shows_tab.dart';

class SellerProfileScreen extends GetView<SellerProfileController> {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header with Background Image
          SizedBox(
            height: 240,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorRes.grey,
                  ),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=1000&auto=format&fit=crop",
                    fit: BoxFit.cover,
                  ),
                ),

                // Back Button
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
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    ),
                  ),
                ),

                // Stats Row
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size(context).width - 40,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=micheal"),
                              ),
                            ),
                            sizedBoxW(15),
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const GlobalText(
                                      str: "Micheal Thomas",
                                      color: ColorRes.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const Row(
                                      children: [
                                        GlobalText(str: "4.8k ", color: ColorRes.white, fontSize: 11, fontWeight: FontWeight.bold),
                                        GlobalText(str: "Followers  •  ", color: ColorRes.white, fontSize: 11),
                                        GlobalText(str: "10 ", color: ColorRes.white, fontSize: 11, fontWeight: FontWeight.bold),
                                        GlobalText(str: "Following", color: ColorRes.white, fontSize: 11),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.8),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications_active, color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                      sizedBoxH(10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, spreadRadius: 1),
                          ],
                        ),
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
              ],
            ),
          ),

          sizedBoxH(20),

          // About Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlobalText(str: "About", fontWeight: FontWeight.bold, fontSize: 16),
                sizedBoxH(8),
                const GlobalText(
                  str: "Lorem is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          sizedBoxH(20),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const GlobalText(str: "Follow", color: Colors.white, fontWeight: FontWeight.bold),
                ),
                sizedBoxH(10),
                Row(
                  children: [
                    Expanded(
                      child: _outlineButton(Assets.appIcons.liveVideoIc.messageIc.path, "Message"),
                    ),
                    sizedBoxW(10),
                    Expanded(
                      child: _outlineButton(Assets.appIcons.liveVideoIc.tipMeIc.path, "Tip Me"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          sizedBoxH(20),

          // Tab Bar
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            width: double.infinity,
            child: TabBar(
              controller: controller.tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              dividerHeight: 0,
              labelColor: ColorRes.black,
              unselectedLabelColor: ColorRes.grey,
              labelPadding: const EdgeInsets.only(left: 0, right: 20),
              padding: const EdgeInsets.only(left: 16),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              indicatorColor: ColorRes.black,
              indicatorSize: TabBarIndicatorSize.label,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              enableFeedback: false,
              tabs: controller.tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),

          // Tab Bar View
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                ShopTab(),
                ShowsTab(),
                ReviewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, {IconData? icon}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon, size: 16, color: Colors.black),
              GlobalText(str: " $value", fontWeight: FontWeight.bold, fontSize: 15),
            ],
          ),
          sizedBoxH(4),
          GlobalText(str: label, fontSize: 12, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _divider() => Container(height: 30, width: 1, color: Colors.grey.shade300);

  Widget _outlineButton(String icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalImageLoader(imagePath: icon, height: 18, width: 18),
          sizedBoxW(8),
          GlobalText(str: label, fontWeight: FontWeight.w500, fontSize: 13),
        ],
      ),
    );
  }
}
