import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/live_stream_controller.dart';

class LiveStreamView extends GetView<LiveStreamController> {
  const LiveStreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: Obx(() => Stack(
            children: [
              // 1. Camera Preview Background
              _buildCameraPreview(),

              // 2. Dark Overlay Gradient
              _buildOverlayGradient(),

              // 3. UI Content
              SafeArea(
                child: Column(
                  children: [
                    // Top Bar
                    _buildTopBar(context),

                    const Spacer(),

                    // Bottom Content (Comments & Product + Right Icons)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Left Side: Comments & Product
                          _buildLeftContent(),

                          sizedBoxW(15),

                          // Right Side: Sidebar Icons
                          _buildSidebar(),
                        ],
                      ),
                    ),

                    sizedBoxH(20),

                    // Bottom Input and Actions
                    _buildBottomActions(),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildCameraPreview() {
    if (!controller.isCameraInitialized.value || controller.cameraController == null) {
      return const Center(child: CircularProgressIndicator(color: ColorRes.white));
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller.cameraController!.value.previewSize?.height ?? 1080,
          height: controller.cameraController!.value.previewSize?.width ?? 1920,
          child: CameraPreview(controller.cameraController!),
        ),
      ),
    );
  }

  Widget _buildOverlayGradient() {
    return Container(
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
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          // User Info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: ColorRes.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    Obx(() => GlobalText(
                          str: "Show time ${controller.streamTime.value}",
                          color: ColorRes.white,
                          fontSize: 10,
                        )),
                  ],
                ),
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
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: ColorRes.black.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: ColorRes.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Comments Area
          SizedBox(
            height: 150,
            child: ListView.builder(
              reverse: true,
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final names = ["Rafsan Jamil", "Rafsan Jamil", "Rafa Tasnim"];
                final messages = [
                  "So Nice, Looking So pretty dress",
                  "Bid for \$7.00",
                  "Won!"
                ];
                final colors = [ColorRes.white, Colors.orange, Colors.orange];
                final avatars = [
                  "https://i.pravatar.cc/150?u=sakib",
                  "https://i.pravatar.cc/150?u=farhan",
                  "https://i.pravatar.cc/150?u=rafa"
                ];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(avatars[index]),
                      ),
                      sizedBoxW(8),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${names[index]} ",
                                style: const TextStyle(
                                  color: ColorRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: messages[index],
                                style: TextStyle(
                                  color: colors[index],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          sizedBoxH(15),
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
                    height: 60,
                    width: 60,
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
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const GlobalText(
                        str: "Brand New",
                        color: ColorRes.white,
                        fontSize: 11,
                      ),
                      Wrap(
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
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const GlobalText(
                      str: "Last Bid \$7.00",
                      color: Colors.orange,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _sideIcon(Assets.appIcons.liveVideoIc.moreVert.path, "More"),
        _sideIcon(Assets.appIcons.liveVideoIc.shareIc.path, "Share", count: "5"),
        GestureDetector(
          onTap: () => controller.switchCamera(),
          child: _sideIcon(Assets.appIcons.liveVideoIc.switchIc.path, "Switch"),
        ),
        _sideIcon(Assets.appIcons.liveVideoIc.viewShopIc.path, "View Shop", isCircle: true),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          // "Say Something" Input
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: ColorRes.white.withValues(alpha: 0.6), width: 1.0),
              borderRadius: BorderRadius.circular(30),
              color: ColorRes.black.withValues(alpha: 0.2),
            ),
            alignment: Alignment.centerLeft,
            child: const GlobalText(
              str: "Say Something",
              color: ColorRes.white,
              fontSize: 14,
            ),
          ),
          sizedBoxH(15),
          // Action Buttons
          Row(
            children: [
              // Bids Button
              Expanded(
                flex: 3,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorRes.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Obx(() => GlobalText(
                        str: "${controller.bidCount.value.toString().padLeft(2, '0')} Bids",
                        color: ColorRes.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              sizedBoxW(12),
              // Run Next Button
              Expanded(
                flex: 7,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade900,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: const GlobalText(
                    str: "Run Next",
                    color: ColorRes.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          sizedBoxH(10),
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
                padding: const EdgeInsets.all(6),
                child: GlobalImageLoader(
                  imagePath: iconPath,
                  height: isCircle ? 40 : 22,
                  width: isCircle ? 40 : 22,
                  fit: BoxFit.contain,
                ),
              ),
              if (count != null)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: ColorRes.black,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalText(
                      str: count,
                      color: ColorRes.white,
                      fontSize: 9,
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
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GlobalText(
        str: text,
        color: ColorRes.white,
        fontSize: 8,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
