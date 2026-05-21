import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(title: "Language"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemCount: controller.languages.length,
                separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFF5F5F5)),
                itemBuilder: (context, index) {
                  final language = controller.languages[index]['name']!;
                  return Obx(() => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: GlobalText(
                      str: language,
                      fontSize: 16,
                      fontWeight: controller.selectedLanguage.value == language 
                          ? FontWeight.bold 
                          : FontWeight.w400,
                    ),
                    trailing: controller.selectedLanguage.value == language
                        ? const Icon(Icons.check_circle, color: ColorRes.appColor)
                        : const Icon(Icons.circle_outlined, color: ColorRes.grey),
                    onTap: () => controller.selectLanguage(language),
                  ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GlobalButtonWidget(
                str: "Save",
                onTap: () {
                  Get.back();
                  Get.snackbar(
                    "Success", 
                    "Language changed to ${controller.selectedLanguage.value}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
