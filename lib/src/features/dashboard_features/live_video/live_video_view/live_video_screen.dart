
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class LiveVideoScreen extends StatefulWidget {
  const LiveVideoScreen({super.key});

  @override
  State<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends State<LiveVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"),
      httpHeaders: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
          _controller.setLooping(true);
        }
      }).catchError((error) {
        debugPrint("Video Player Error: $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToSellerProfile(BuildContext context) {
    Get.toNamed(AppRouteKeys.sellerProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: Stack(
        children: [
          // Background Video
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator(color: ColorRes.white)),

          // Dark Overlay Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorRes.black.withValues(alpha: 0.4),
                  Colors.transparent,
                  ColorRes.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      // User Info & Follow Button
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => _navigateToSellerProfile(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    radius: 18,
                                    backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=annie"),
                                  ),
                                  sizedBoxW(8),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const GlobalText(
                                          str: "Annie Marie",
                                          color: ColorRes.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.star, color: ColorRes.white, size: 12),
                                            GlobalText(
                                              str: " 4.9",
                                              color: ColorRes.white,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxW(12),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade800,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const GlobalText(
                                  str: "Follow",
                                  color: ColorRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            sizedBoxW(4),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Viewers Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.sensors, color: Colors.red, size: 16),
                            sizedBoxW(6),
                            const GlobalText(
                              str: "1K",
                              color: ColorRes.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      sizedBoxW(10),
                      // Close Button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorRes.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.keyboard_arrow_down, color: ColorRes.white, size: 28),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Comments & Product
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Comments Area
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: 4,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final names = ["Nazmul Islam Sakib", "Farhan Tanvir Chowdhury", "Rafsan Jamil", "Rafa Jamila"];
                                  final avatars = [
                                    "https://i.pravatar.cc/150?u=sakib",
                                    "https://i.pravatar.cc/150?u=farhan",
                                    "https://i.pravatar.cc/150?u=rafsan",
                                    "https://i.pravatar.cc/150?u=rafa"
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(avatars[index]),
                                        ),
                                        sizedBoxW(10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GlobalText(
                                                str: names[index],
                                                color: ColorRes.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const GlobalText(
                                                str: "So Nice, Looking So pretty dress",
                                                color: ColorRes.white,
                                                fontSize: 11,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            sizedBoxH(10),
                            // Product Card
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ColorRes.black.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GlobalImageLoader(
                                      imagePath: Assets.dummyImg.homeDummyImg2.path,
                                      height: 65,
                                      width: 65,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  sizedBoxW(12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const GlobalText(
                                          str: "ZaRa Original Hand bag",
                                          color: ColorRes.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const GlobalText(
                                          str: "Brand New",
                                          color: ColorRes.white,
                                          fontSize: 12,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        sizedBoxH(6),
                                        Row(
                                          children: [
                                            _badge("Free Shipping", ColorRes.indigo.withValues(alpha: 0.7)),
                                            sizedBoxW(6),
                                            _badge("+ Taxes", ColorRes.grey.withValues(alpha: 0.7)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const GlobalText(
                                        str: "\$10.00",
                                        color: ColorRes.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      GlobalText(
                                        str: "Sold",
                                        color: Colors.orange.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxW(20),
                      // Right Side Icons
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _sideIcon(Assets.appIcons.liveVideoIc.moreVert.path, "More"),
                          _sideIcon(Assets.appIcons.liveVideoIc.tipIc.path, "Tip"),
                          _sideIcon(Assets.appIcons.liveVideoIc.walletIc.path, "Wallet"),
                          _sideIcon(Assets.appIcons.liveVideoIc.shareIc.path, "Share", count: "5"),
                          _sideIcon(Assets.appIcons.liveVideoIc.viewShopIc.path, "View\nShop", isCircle: true),
                        ],
                      ),
                    ],
                  ),
                ),

                sizedBoxH(20),
                // Bottom Input and Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      // "Say Something" Input
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.white.withValues(alpha: 0.8), width: 1.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const GlobalText(
                          str: "Say Something",
                          color: ColorRes.white,
                          fontSize: 15,
                        ),
                      ),
                      sizedBoxH(15),
                      // Awaiting Next Item Button
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Awaiting Next Item",
                          color: ColorRes.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxH(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideIcon(String iconPath, String label, {String? count, bool isCircle = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                child: GlobalImageLoader(
                  imagePath: iconPath,
                  height: isCircle == true ? 42 : 22,
                  width: isCircle == true ? 42 : 22,
                  fit: BoxFit.fill,
                ),
              ),
              if (count != null)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: ColorRes.black,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalText(
                      str: count,
                      color: ColorRes.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          sizedBoxH(2),
          GlobalText(
            str: label,
            color: ColorRes.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GlobalText(
        str: text,
        color: ColorRes.white,
        fontSize: 9,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
