import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/create_listing_controller.dart';

class CreateListingScreen extends GetView<CreateListingController> {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        isBackIc: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, color: ColorRes.black),
          ),
          sizedBoxW(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxH(20),
            const GlobalText(
              str: "Let's get started!",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ColorRes.black,
            ),
            sizedBoxH(10),
            const GlobalText(
              str: "Before you start selling, please review and\naccept these guidelines",
              fontSize: 14,
              color: ColorRes.grey900,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(40),
            _buildGuidelineItem(
              imagePath: Assets.appIcons.buttomNavIc.profileIc.path,
              title: "Honor Every Sale",
              description: "Complete all successful auctions, even if the final bid is lower than expected.",
            ),
            _buildGuidelineItem(
              imagePath: Assets.appIcons.buttomNavIc.profileIc.path,
              title: "No Counterfeit Items",
              description: "Only sell authentic products. If you're unsure whether an item is genuine, do not list it.",
            ),
            _buildGuidelineItem(
              imagePath: Assets.appIcons.buttomNavIc.profileIc.path,
              title: "Sell With Transparency",
              description: "Do not provide false or misleading information about any product you list.",
            ),
            _buildGuidelineItem(
              imagePath: Assets.appIcons.buttomNavIc.profileIc.path,
              title: "Fast & Safe Shipping",
              description: "Orders should be shipped within 2 business days after a sale or livestream ends.",
            ),
            sizedBoxH(40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Checkbox(
                  value: controller.isAgreed.value,
                  onChanged: controller.toggleAgreement,
                  activeColor: ColorRes.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                )),
                const Expanded(
                  child: GlobalText(
                    str: "I agree to the guidelines and understand that Whatnot may send SMS updates to verify my submission and keep me informed about my progress.",
                    fontSize: 12,
                    color: ColorRes.grey900,
                  ),
                ),
              ],
            ),
            sizedBoxH(30),
            Obx(() => InkWell(
              onTap: controller.isAgreed.value ? () {
                Get.toNamed(AppRouteKeys.categorySelection);
              } : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: controller.isAgreed.value ? ColorRes.appColor : const Color(0xFFFFB295),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: GlobalText(
                    str: "Got it!",
                    color: ColorRes.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
            sizedBoxH(20),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidelineItem({required String imagePath, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: GlobalImageLoader(
              imagePath: imagePath,
              height: 20,
              width: 20,
              color: ColorRes.black,
            ),
          ),
          sizedBoxW(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.black,
                ),
                sizedBoxH(4),
                GlobalText(
                  str: description,
                  fontSize: 13,
                  color: ColorRes.grey900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
