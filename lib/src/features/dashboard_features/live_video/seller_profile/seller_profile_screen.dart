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
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header with Background Image
                  SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        Container(
                          height: 280,
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
                              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
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
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const GlobalText(
                                            str: "Micheal Thomas",
                                            color: ColorRes.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                GlobalText(str: "4.8k ", color: ColorRes.white, fontSize: 11, fontWeight: FontWeight.bold),
                                                GlobalText(str: "Followers  •  ", color: ColorRes.white, fontSize: 11),
                                                GlobalText(str: "10 ", color: ColorRes.white, fontSize: 11, fontWeight: FontWeight.bold),
                                                GlobalText(str: "Following", color: ColorRes.white, fontSize: 11),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        _showNotificationBottomSheet(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.8),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.notifications_active, color: Colors.black),
                                      ),
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
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            ShopTab(),
            ShowsTab(),
            ReviewsTab(),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String value, String label, {IconData? icon}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, size: 16, color: Colors.black),
                GlobalText(str: " $value", fontWeight: FontWeight.bold, fontSize: 15),
              ],
            ),
          ),
          sizedBoxH(4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: GlobalText(str: label, fontSize: 12, color: Colors.grey),
          ),
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

  void _showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              sizedBoxH(20),
              const GlobalText(
                str: "Live Show Setting",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              sizedBoxH(20),
              const Divider(height: 1),
              Obx(() => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(Icons.notifications, color: Colors.black),
                    ),
                    title: const GlobalText(str: "All Notification", fontWeight: FontWeight.bold),
                    subtitle: const GlobalText(str: "Receive all notifications", fontSize: 12, color: Colors.grey),
                    trailing: Radio<int>(
                      value: 0,
                      groupValue: controller.selectedNotification.value,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        controller.selectedNotification.value = value!;
                      },
                    ),
                  )),
              Obx(() => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(Icons.notifications_off, color: Colors.black),
                    ),
                    title: const GlobalText(str: "No Notifications", fontWeight: FontWeight.bold),
                    subtitle: const GlobalText(str: "Turn off notifications", fontSize: 12, color: Colors.grey),
                    trailing: Radio<int>(
                      value: 1,
                      groupValue: controller.selectedNotification.value,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        controller.selectedNotification.value = value!;
                      },
                    ),
                  )),
              sizedBoxH(50),
            ],
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._container);

  final Container _container;

  @override
  double get minExtent => 50;
  @override
  double get maxExtent => 50;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _container;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
