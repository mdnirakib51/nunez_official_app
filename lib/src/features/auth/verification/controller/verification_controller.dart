import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class VerificationController extends GetxController {
  final otpControllers = List.generate(6, (index) => TextEditingController());
  final focusNodes = List.generate(6, (index) => FocusNode());
  final otpValues = List.generate(6, (index) => "").obs;
  
  final timerText = "00:15".obs;
  final canResend = false.obs;
  final isLoading = false.obs;
  final isInvalid = false.obs;
  late Timer _timer;
  int _start = 15;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _start = 15;
    canResend.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        canResend.value = true;
      } else {
        _start--;
        timerText.value = "00:${_start.toString().padLeft(2, '0')}";
      }
    });
  }

  void resendCode() {
    if (canResend.value) {
      startTimer();
      log("Resending OTP...");
    }
  }

  void submitOTP() {
    String otp = otpControllers.map((e) => e.text).join();
    if (otp.length < 6) {
      isInvalid.value = true;
      showErrorBottomSheet();
      return;
    }
    
    isLoading.value = true;
    isInvalid.value = false;
    log("Submitting OTP: $otp");
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.toNamed(AppRouteKeys.setupProfileCountry);
    });
  }

  void showErrorBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: ColorRes.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            sizedBoxH(20),
            const Icon(Icons.cancel, color: ColorRes.red, size: 50),
            sizedBoxH(20),
            const GlobalText(
              str: AppStrings.incorrectCode,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            sizedBoxH(10),
            const GlobalText(
              str: AppStrings.pleaseCheckOtp,
              fontSize: 14,
              color: ColorRes.grey,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(30),
            GlobalButtonWidget(
              str: AppStrings.gotIt,
              onTap: () => Get.back(),
              buttomColor: ColorRes.appButtonColor,
              radius: 30,
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  void onClose() {
    _timer.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
