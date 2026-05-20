
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../app/routes/app_route.dart';
import '../controller/category_selection_controller.dart';

class CategorySelectionScreen extends GetView<CategorySelectionController> {
  const CategorySelectionScreen({super.key});

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
                  str: "Which category will you sell in\nmost often?",
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
                sizedBoxH(20),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Obx(() {
                  bool isSelected = controller.selectedCategory.value == index;
                  return InkWell(
                    onTap: () => controller.selectCategory(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? ColorRes.appColor : Colors.grey.withValues(alpha: 0.2),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlobalImageLoader(
                            imagePath: category['icon']!,
                            height: 40,
                            width: 40,
                          ),
                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: GlobalText(
                              str: category['title']!,
                              fontSize: 11,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                Get.toNamed(AppRouteKeys.subCategorySelection);
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
