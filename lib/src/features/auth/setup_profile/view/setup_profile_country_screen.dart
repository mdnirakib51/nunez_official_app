import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileCountryScreen extends GetView<SetupProfileController> {
  const SetupProfileCountryScreen({super.key});

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
                      str: AppStrings.addCountryResidence,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    sizedBoxH(10),
                    const GlobalText(
                      str: AppStrings.makeSureItsYou,
                      fontSize: 16,
                      color: ColorRes.grey,
                    ),
                    sizedBoxH(40),
                    Obx(() => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectedCountry.value,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: controller.countries.map((String country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: GlobalText(str: country, fontSize: 16),
                                );
                              }).toList(),
                              onChanged: (value) => controller.updateCountry(value),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GlobalButtonWidget(
                str: AppStrings.next,
                onTap: () => Get.toNamed(AppRouteKeys.setupProfileGender),
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
