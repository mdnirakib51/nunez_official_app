import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileGenderScreen extends GetView<SetupProfileController> {
  const SetupProfileGenderScreen({super.key});

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(30),
                    const GlobalText(
                      str: AppStrings.whatsYourGender,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    sizedBoxH(10),
                    const GlobalText(
                      str: AppStrings.suggestMoreCategories,
                      fontSize: 16,
                      color: ColorRes.grey,
                    ),
                    sizedBoxH(40),
                    _buildGenderOption(AppStrings.male),
                    sizedBoxH(15),
                    _buildGenderOption(AppStrings.female),
                    sizedBoxH(15),
                    _buildGenderOption(AppStrings.nonBinary),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GlobalButtonWidget(
                str: AppStrings.next,
                onTap: () {
                  if (controller.selectedGender.value.isNotEmpty) {
                    Get.toNamed(AppRouteKeys.setupProfileInterests);
                  }
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

  Widget _buildGenderOption(String gender) {
    return Obx(() {
      bool isSelected = controller.selectedGender.value == gender;
      return GestureDetector(
        onTap: () => controller.selectGender(gender),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF262626) : ColorRes.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey.shade300,
            ),
          ),
          alignment: Alignment.center,
          child: GlobalText(
            str: gender,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? ColorRes.white : ColorRes.black,
          ),
        ),
      );
    });
  }
}
