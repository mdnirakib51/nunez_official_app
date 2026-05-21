import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/help_support_controller.dart';

class HelpSupportView extends GetView<HelpSupportController> {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Help and Support",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxH(20),
              const GlobalText(
                str: "If you are experiencing any issue, please let us know. we’ll try to solve ythis issue as soon as possible",
                fontSize: 14,
                color: ColorRes.black,
              ),
              sizedBoxH(30),

              const GlobalText(
                str: "Title",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              sizedBoxH(10),
              GlobalTextFormField(
                controller: controller.titleController,
                hintText: "Issue title",
                fillColor: ColorRes.white,
                filled: true,
                decoration: borderDecoration,
              ),

              sizedBoxH(20),

              const GlobalText(
                str: "Description",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              sizedBoxH(10),
              GlobalTextFormField(
                controller: controller.descriptionController,
                hintText: "Write here",
                maxLines: 6,
                fillColor: ColorRes.white,
                filled: true,
                decoration: borderDecoration,
              ),

              sizedBoxH(100),
              Column(
                children: [
                  Obx(() => GlobalButtonWidget(
                    str: "Submit",
                    onTap: controller.isLoading.value ? () {} : () => controller.submitTicket(),
                    buttomColor: ColorRes.appButtonColor,
                    textColor: ColorRes.white,
                    radius: 30,
                    child: controller.isLoading.value
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: ColorRes.white, strokeWidth: 2))
                        : null,
                  )),
                  sizedBoxH(20),
                  const GlobalText(
                    str: "You can also contact us on this number",
                    fontSize: 14,
                    color: ColorRes.grey,
                  ),
                  sizedBoxH(5),
                  const GlobalText(
                    str: "+61 0000 0000 00",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
