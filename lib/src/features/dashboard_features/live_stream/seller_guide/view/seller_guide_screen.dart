import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../controller/seller_guide_controller.dart';

class SellerGuideScreen extends GetView<SellerGuideController> {
  const SellerGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient/Image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Stack(
              children: [
                GlobalImageLoader(
                  imagePath: Assets.appImages.sellerBackImg.path,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      sizedBoxH(40),
                      Center(
                        child: GlobalImageLoader(
                          imagePath: Assets.appIcons.appLogoIc.path,
                          height: 110,
                          width: 110,
                          fit: BoxFit.contain,
                        ),
                      ),
                      sizedBoxH(20),
                      const GlobalText(
                        str: "Start Selling",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.white,
                      ),
                      sizedBoxH(6),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: GlobalText(
                          str: "Use this guide to learn the basics and prepare for your live show!",
                          fontSize: 14,
                          color: ColorRes.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 0,
                  right: 20,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.cancel, color: ColorRes.white, size: 30),
                  ),
                ),
              ],
            ),
          ),

          // Guidelines Card
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorRes.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const GlobalText(
                              str: "Guidelines",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorRes.black,
                            ),
                            const Divider(),
                            sizedBoxH(10),
                            ...controller.guidelines.map((guide) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Icon(Icons.circle, size: 6, color: ColorRes.black),
                                  ),
                                  sizedBoxW(10),
                                  Expanded(
                                    child: GlobalText(
                                      str: guide,
                                      fontSize: 14,
                                      color: ColorRes.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        // Action for Let's Start
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: ColorRes.appColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: GlobalText(
                            str: "Let's Start",
                            color: ColorRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxH(MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
