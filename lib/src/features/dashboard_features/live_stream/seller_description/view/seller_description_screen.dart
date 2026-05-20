
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/components/global_appbar.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../../../../../app/routes/app_route.dart';
import '../controller/seller_description_controller.dart';

class SellerDescriptionScreen extends GetView<SellerDescriptionController> {
  const SellerDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        isBackIc: true,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, color: ColorRes.black),
          ),
          sizedBoxW(10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH(10),
                const GlobalText(
                  str: "Which of those better describe you?",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.black,
                ),
                sizedBoxH(8),
                const GlobalText(
                  str: "You can change or add more later",
                  fontSize: 14,
                  color: ColorRes.grey,
                ),
                sizedBoxH(25),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: controller.descriptions.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  bool isSelected = controller.selectedIndex.value == index;
                  return InkWell(
                    onTap: () => controller.selectDescription(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? ColorRes.appColor : Colors.grey.withValues(alpha: 0.3),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GlobalText(
                              str: controller.descriptions[index],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? ColorRes.appColor : Colors.grey.withValues(alpha: 0.5),
                                width: isSelected ? 5 : 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRouteKeys.sellerGuide);
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
                    str: "Next",
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
    );
  }
}
