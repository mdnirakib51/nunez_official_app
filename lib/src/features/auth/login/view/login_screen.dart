import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../../../../app/routes/app_route.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
          str: AppStrings.loginTitle,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxH(30),

              // Email Field
              GlobalTextFormField(
                controller: controller.emailController,
                titleText: AppStrings.emailAddress,
                hintText: AppStrings.enterEmail,
                prefixIcon: const Icon(Icons.email_outlined, size: 20),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: controller.validateEmail,
                decoration: borderDecoration,
              ),
              sizedBoxH(20),

              // Password Field
              GlobalTextFormField(
                controller: controller.passwordController,
                titleText: AppStrings.password,
                hintText: AppStrings.password,
                isPasswordField: true,
                prefixIcon: const Icon(Icons.lock_outline, size: 20),
                textInputAction: TextInputAction.done,
                validator: controller.validatePassword,
                decoration: borderDecoration,
                onFieldSubmitted: (_) => controller.login(),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRouteKeys.forgotPass),
                  child: const GlobalText(
                    str: AppStrings.forgotPassword,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorRes.black,
                  ),
                ),
              ),
              sizedBoxH(20),

              // Login Button
              Obx(() => GlobalButtonWidget(
                onTap: controller.isLoading.value ? () {} : controller.login,
                str: AppStrings.logIn,
                buttomColor: ColorRes.appButtonColor,
                radius: 30,
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: ColorRes.white, strokeWidth: 2),
                      )
                    : null,
              )),
              sizedBoxH(30),

              // Or divider
              Row(
                children: [
                  const Expanded(child: Divider(color: ColorRes.white200)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GlobalText(
                      str: AppStrings.or,
                      color: ColorRes.grey.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                  ),
                  const Expanded(child: Divider(color: ColorRes.white200)),
                ],
              ),
              sizedBoxH(30),

              // Google Login Button
              GestureDetector(
                onTap: controller.loginWithGoogle,
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: ColorRes.grey.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.socialIc.googleIc.image(height: 24),
                      sizedBoxW(10),
                      const GlobalText(
                        str: AppStrings.continueWithGoogle,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              sizedBoxH(30),

              // Sign Up Link
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRouteKeys.registration),
                  child: RichText(
                    text: TextSpan(
                      text: AppStrings.dontHaveAccount,
                      style: const TextStyle(
                        color: ColorRes.grey,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signUp,
                          style: TextStyle(
                            color: ColorRes.appButtonColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizedBoxH(20),
            ],
          ),
        ),
      ),
    );
  }
}
