import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../gen/assets.gen.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_image_loader.dart';
import '../../../global/global_widget/global_sized_box.dart';
import '../../../global/global_widget/global_text.dart';

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
    // Using the most standard and widely supported test video URL
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
        // Simple error handling: Try a direct small video if the first one fails
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Video error: $error")),
           );
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

          // Dark Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorRes.black.withValues(alpha: 0.3),
                  Colors.transparent,
                  ColorRes.black.withValues(alpha: 0.5),
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
                      // User Info
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=annie"),
                            ),
                            sizedBoxW(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const GlobalText(
                                  str: "Annie Marie",
                                  color: ColorRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: ColorRes.white, size: 12),
                                    const GlobalText(
                                      str: " 4.9",
                                      color: ColorRes.white,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            sizedBoxW(12),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
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
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.bar_chart, color: ColorRes.white, size: 12),
                            ),
                            sizedBoxW(6),
                            const GlobalText(
                              str: "1K",
                              color: ColorRes.white,
                              fontSize: 12,
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
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorRes.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.keyboard_arrow_down, color: ColorRes.white, size: 24),
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
                              height: 120,
                              child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  final names = ["Rafa Jamila", "Rafsan Jamil"];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: ColorRes.grey.withValues(alpha: 0.5),
                                          backgroundImage: index == 1 ? const NetworkImage("https://i.pravatar.cc/150?u=rafsan") : null,
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
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: ColorRes.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: GlobalImageLoader(
                                      imagePath: Assets.dummyImg.homeDummyImg2.path,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  sizedBoxW(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const GlobalText(
                                          str: "ZaRa Original Hand bag",
                                          color: ColorRes.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const GlobalText(
                                          str: "Brand New",
                                          color: ColorRes.white,
                                          fontSize: 11,
                                        ),
                                        sizedBoxH(4),
                                        Row(
                                          children: [
                                            _badge("Free Shipping", ColorRes.indigo),
                                            sizedBoxW(5),
                                            _badge("+ Taxes", ColorRes.grey),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const GlobalText(
                                        str: "Sold",
                                        color: Colors.orange,
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxW(15),
                      // Right Side Icons
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _sideIcon(Assets.appIcons.liveVideoIc.moreVert.path, "More"),
                          _sideIcon(Assets.appIcons.liveVideoIc.tipIc.path, "Tip"),
                          _sideIcon(Assets.appIcons.liveVideoIc.walletIc.path, "Wallet"),
                          _sideIcon(Assets.appIcons.liveVideoIc.shareIc.path, "Share", count: "5"),
                          _sideIcon(Assets.appIcons.liveVideoIc.viewShopIc.path, "View Shop", isCircle: true),
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
                      // Search-like Input
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.white, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const GlobalText(
                          str: "Say Something",
                          color: ColorRes.white,
                          fontSize: 14,
                        ),
                      ),
                      sizedBoxH(15),
                      // Awaiting Next Item Button
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Awaiting Next Item",
                          color: ColorRes.white,
                          fontSize: 14,
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
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isCircle ? ColorRes.white.withValues(alpha: 0.2) : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isCircle ? Border.all(color: ColorRes.white, width: 1) : null,
                ),
                child: GlobalImageLoader(
                  imagePath: iconPath,
                  height: 24,
                  width: 24,
                  color: ColorRes.white,
                ),
              ),
              if (count != null)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: ColorRes.black,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalText(
                      str: count,
                      color: ColorRes.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          sizedBoxH(4),
          GlobalText(
            str: label,
            color: ColorRes.white,
            fontSize: 10,
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
        color: color.withValues(alpha: 0.8),
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
