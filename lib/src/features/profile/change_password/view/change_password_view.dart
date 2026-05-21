import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Change Password",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxH(20),
                      const GlobalText(
                        str: "Please set your new password",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      sizedBoxH(30),

                      // Current Password
                      GlobalTextFormField(
                        controller: controller.currentPasswordController,
                        titleText: "Current Password",
                        hintText: "********",
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                        textInputAction: TextInputAction.next,
                        validator: controller.validateCurrentPassword,
                      ),

                      sizedBoxH(20),

                      // New Password
                      GlobalTextFormField(
                        controller: controller.newPasswordController,
                        titleText: "New Password",
                        hintText: "********",
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                        textInputAction: TextInputAction.next,
                        validator: controller.validateNewPassword,
                      ),

                      sizedBoxH(20),

                      // Confirm New Password
                      GlobalTextFormField(
                        controller: controller.confirmPasswordController,
                        titleText: "Confirm New Password",
                        hintText: "********",
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                        textInputAction: TextInputAction.done,
                        validator: controller.validateConfirmPassword,
                        onFieldSubmitted: (_) => controller.changePassword(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Fixed Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => GlobalButtonWidget(
                str: "Change Password",
                onTap: controller.isLoading.value ? () {} : () => controller.changePassword(),
                buttomColor: ColorRes.appButtonColor,
                textColor: ColorRes.white,
                radius: 30,
                height: 55,
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: ColorRes.white, strokeWidth: 2)
                      )
                    : null,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
