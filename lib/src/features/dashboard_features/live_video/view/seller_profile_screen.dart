import 'package:flutter/material.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0, // Default to Shop
        child: Column(
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
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=1000&auto=format&fit=crop",
                        fit: BoxFit.cover,
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
              child: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                labelColor: ColorRes.black,
                unselectedLabelColor: ColorRes.grey,
                labelPadding: EdgeInsets.only(left: 0, right: 20),
                padding: EdgeInsets.only(left: 16),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                indicatorColor: ColorRes.black,
                indicatorSize: TabBarIndicatorSize.label,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                enableFeedback: false,
                tabs: [
                  Tab(text: "Shop"),
                  Tab(text: "Shows"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  _shopTab(),
                  _showsTab(),
                  _reviewsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shopTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  index == 0
                      ? "https://images.unsplash.com/photo-1523275335684-37898b6baf30"
                      : index == 1
                          ? "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
                          : index == 2
                              ? "https://images.unsplash.com/photo-1572635196237-14b3f281503f"
                              : "https://images.unsplash.com/photo-1485955900006-10f4d324d411",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            sizedBoxH(8),
            const GlobalText(
              str: "Luxury Product Item",
              fontSize: 13,
              fontWeight: FontWeight.bold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            sizedBoxH(4),
            Row(
              children: [
                const GlobalText(
                  str: "\$120.00",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 14),
                ),
              ],
            ),
          ],
        );
      },
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

  Widget _showsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 12, backgroundImage: NetworkImage(index == 0 ? "https://i.pravatar.cc/150?u=rafsan" : "https://i.pravatar.cc/150?u=irfan")),
                sizedBoxW(8),
                GlobalText(str: index == 0 ? "Rafsan Jamil" : "Irfan Haider", fontSize: 12, fontWeight: FontWeight.bold),
              ],
            ),
            sizedBoxH(8),
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      index == 0 ? "https://images.unsplash.com/photo-1542291026-7eec264c27ff" : "https://images.unsplash.com/photo-1441984904996-e0b6ba687e04",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                      child: const GlobalText(str: "Live • 84", color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _reviewsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 1,
      itemBuilder: (context, index) => Container(
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
    );
  }

  Widget _reviewImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, height: 70, width: 70, fit: BoxFit.cover),
    );
  }
}
