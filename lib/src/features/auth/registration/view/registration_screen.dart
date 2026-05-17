import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends GetView<RegisterController> {
  const RegistrationScreen({super.key});

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
        title: const GlobalText(
          str: AppStrings.signup,
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
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxH(24),
                      
                      // Full Name
                      GlobalTextFormField(
                        controller: controller.nameController,
                        titleText: AppStrings.fullName,
                        hintText: AppStrings.enterName,
                        prefixIcon: const Icon(Icons.person_outline, size: 22, color: ColorRes.grey),
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                      ),
                      
                      sizedBoxH(20),
                      
                      // Email Address
                      GlobalTextFormField(
                        controller: controller.emailController,
                        titleText: AppStrings.emailAddress,
                        hintText: AppStrings.enterEmail,
                        prefixIcon: const Icon(Icons.email_outlined, size: 22, color: ColorRes.grey),
                        keyboardType: TextInputType.emailAddress,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                      ),
                      
                      sizedBoxH(20),
                      
                      // Password
                      GlobalTextFormField(
                        controller: controller.passwordController,
                        titleText: AppStrings.password,
                        hintText: AppStrings.password,
                        prefixIcon: const Icon(Icons.lock_outline, size: 22, color: ColorRes.grey),
                        isPasswordField: true,
                        fillColor: ColorRes.white,
                        filled: true,
                        decoration: borderDecoration,
                      ),
                      
                      sizedBoxH(24),
                      
                      // Terms and Conditions Checkbox
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: controller.agreeTerms.value,
                              onChanged: (value) => controller.agreeTerms.value = value ?? false,
                              activeColor: ColorRes.appButtonColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              side: const BorderSide(color: ColorRes.grey, width: 1.5),
                            ),
                          )),
                          sizedBoxW(12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: ColorRes.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  height: 1.4,
                                ),
                                children: [
                                  const TextSpan(text: AppStrings.agreeTermsPrefix),
                                  TextSpan(
                                    text: AppStrings.termsOfService,
                                    style: TextStyle(
                                      color: ColorRes.black.withOpacity(0.8),
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(text: AppStrings.and),
                                  TextSpan(
                                    text: AppStrings.privacyPolicy,
                                    style: TextStyle(
                                      color: ColorRes.black.withOpacity(0.8),
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxH(30),
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom Fixed Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => GlobalButtonWidget(
                str: AppStrings.signUp,
                onTap: controller.isLoading.value ? () {} : () => controller.register(),
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
