import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileSubInterestsScreen extends GetView<SetupProfileController> {
  const SetupProfileSubInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorRes.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const GlobalText(
          str: AppStrings.setUpYourProfile,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ColorRes.black,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(30),
                    const GlobalText(
                      str: AppStrings.tellUsABitMore,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    sizedBoxH(10),
                    const GlobalText(
                      str: AppStrings.pickOnlyWhatYouArePassionateAbout,
                      fontSize: 16,
                      color: ColorRes.grey,
                    ),
                    sizedBoxH(30),
                    ...controller.subInterestsMap.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalText(
                            str: entry.key,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorRes.black,
                          ),
                          sizedBoxH(15),
                          Obx(() => Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: entry.value.map((subInterest) {
                                  bool isSelected = controller.selectedSubInterests.contains(subInterest);
                                  return InkWell(
                                    onTap: () => controller.toggleSubInterest(subInterest),
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: isSelected ? const Color(0xFF252525) : Colors.grey.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: GlobalText(
                                        str: subInterest,
                                        fontSize: 13,
                                        color: isSelected ? ColorRes.white : ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),
                          sizedBoxH(25),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GlobalButtonWidget(
                str: AppStrings.next,
                onTap: () {
                  Get.offAllNamed(AppRouteKeys.dashboard);
                },
                buttomColor: ColorRes.appButtonColor,
                radius: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
