import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/forgot_controller.dart';

class SetNewPasswordScreen extends GetView<ForgotController> {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: ColorRes.black, size: 28),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.setNewPassFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxH(20),
                      const GlobalText(
                        str: AppStrings.setNewPassword,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      sizedBoxH(12),
                      const GlobalText(
                        str: AppStrings.setNewPasswordSubTitle,
                        fontSize: 14,
                        color: ColorRes.grey900,
                      ),
                      sizedBoxH(30),
                      
                      // New Password
                      GlobalTextFormField(
                        controller: controller.passwordController,
                        titleText: AppStrings.newPassword,
                        hintText: "********",
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                        textInputAction: TextInputAction.next,
                        validator: controller.validatePassword,
                      ),

                      sizedBoxH(20),

                      // Confirm New Password
                      GlobalTextFormField(
                        controller: controller.confirmPasswordController,
                        titleText: AppStrings.confirmPassword,
                        hintText: "********",
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                        textInputAction: TextInputAction.done,
                        validator: controller.validateConfirmPassword,
                        onFieldSubmitted: (_) => controller.resetPassword(),
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
                str: AppStrings.resetPassword,
                onTap: controller.isLoading.value ? () {} : () => controller.resetPassword(),
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
