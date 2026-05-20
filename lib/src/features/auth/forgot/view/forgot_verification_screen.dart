import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/forgot_controller.dart';

class ForgotVerificationScreen extends GetView<ForgotController> {
  const ForgotVerificationScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(20),
                    const GlobalText(
                      str: AppStrings.verification,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    sizedBoxH(12),
                    GlobalText(
                      str: "${AppStrings.enterCodeSent}${controller.emailController.text}",
                      fontSize: 14,
                      color: ColorRes.grey,
                    ),
                    sizedBoxH(30),
                    const GlobalText(
                      str: AppStrings.enterOtp,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    sizedBoxH(15),
                    
                    // OTP Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return Obx(() {
                          bool isFilled = controller.otpValues[index].isNotEmpty;
                          return Container(
                            height: 55,
                            width: (size(context).width - 90) / 6,
                            decoration: BoxDecoration(
                              color: isFilled ? ColorRes.white : ColorRes.grey.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isFilled ? ColorRes.green : ColorRes.grey.withValues(alpha: 0.2),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: controller.otpControllers[index],
                              focusNode: controller.focusNodes[index],
                              onChanged: (value) {
                                controller.otpValues[index] = value;
                                if (value.length == 1 && index < 5) {
                                  controller.focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  controller.focusNodes[index - 1].requestFocus();
                                }
                                if (controller.otpValues.where((v) => v.isNotEmpty).length == 6) {
                                  controller.verifyOTP();
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                                hintText: "●",
                                hintStyle: TextStyle(color: ColorRes.white200, fontSize: 10),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isFilled ? ColorRes.green : ColorRes.appButtonColor,
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                    
                    sizedBoxH(25),
                    
                    // Resend Timer
                    Obx(() => Row(
                      children: [
                        const GlobalText(
                          str: AppStrings.resendCodeIn,
                          fontSize: 14,
                          color: ColorRes.grey,
                        ),
                        GlobalText(
                          str: controller.timerText.value,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    )),
                    
                    // Resend Action
                    Obx(() => controller.canResend.value 
                      ? TextButton(
                          onPressed: controller.resendCode,
                          child: const GlobalText(
                            str: "Resend Code",
                            color: ColorRes.appButtonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const SizedBox.shrink()),
                  ],
                ),
              ),
            ),
            
            // Bottom Submit Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => GlobalButtonWidget(
                str: AppStrings.submit,
                onTap: controller.isLoading.value ? () {} : () => controller.verifyOTP(),
                buttomColor: ColorRes.appButtonColor,
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
