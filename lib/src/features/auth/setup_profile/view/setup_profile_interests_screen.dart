import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileInterestsScreen extends GetView<SetupProfileController> {
  const SetupProfileInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: AppStrings.setUpYourProfile,
        isBackIc: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, color: ColorRes.black),
          ),
          sizedBoxW(10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH(10),
                const GlobalText(
                  str: AppStrings.whatDoYouLikeToShopFor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.black,
                ),
                sizedBoxH(8),
                const GlobalText(
                  str: AppStrings.pickAFewToGetStarted,
                  fontSize: 14,
                  color: ColorRes.grey900,
                ),
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
              itemCount: controller.interests.length,
              itemBuilder: (context, index) {
                final category = controller.interests[index];
                final String title = category['title']!;
                return Obx(() {
                  bool isSelected = controller.selectedInterests.contains(title);
                  return InkWell(
                    onTap: () => controller.toggleInterest(title),
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
            child: GlobalButtonWidget(
              str: AppStrings.next,
              onTap: () {
                if (controller.selectedInterests.isNotEmpty) {
                  Get.toNamed(AppRouteKeys.setupProfileSubInterests);
                }
              },
              buttomColor: ColorRes.appButtonColor,
              radius: 30,
            ),
          ),
          sizedBoxH(MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  IconData _getInterestIcon(String name) {
    if (name.contains('Cards')) return Icons.style_outlined;
    if (name.contains('Sneakers')) return Icons.directions_run_outlined;
    if (name.contains('Video')) return Icons.videogame_asset_outlined;
    if (name.contains('Toys')) return Icons.toys_outlined;
    if (name.contains('Comics')) return Icons.menu_book_outlined;
    if (name.contains('Electronics')) return Icons.devices_outlined;
    return Icons.category_outlined;
  }
}
