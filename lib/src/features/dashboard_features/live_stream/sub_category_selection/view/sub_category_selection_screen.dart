import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/components/global_appbar.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../../../../../app/routes/app_route.dart';
import '../controller/sub_category_selection_controller.dart';

class SubCategorySelectionScreen extends GetView<SubCategorySelectionController> {
  const SubCategorySelectionScreen({super.key});

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
                  str: "Which sub-category will you sell in most often?",
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
                const GlobalText(
                  str: "Toys & Hobbies",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.black,
                ),
                sizedBoxH(15),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.subCategories.map((subCat) {
                bool isSelected = controller.selectedSubCategory.value == subCat;
                return InkWell(
                  onTap: () => controller.selectSubCategory(subCat),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF252525) : Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GlobalText(
                      str: subCat,
                      fontSize: 13,
                      color: isSelected ? ColorRes.white : ColorRes.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRouteKeys.sellerDescription);
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
