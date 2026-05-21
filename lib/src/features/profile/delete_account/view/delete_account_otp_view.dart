import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/delete_account_controller.dart';

class DeleteAccountOtpView extends GetView<DeleteAccountController> {
  const DeleteAccountOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Delete Account",
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
                      str: "This action will delete your all plans and permanently erase your all data. You cannot undo this action.",
                      fontSize: 14,
                      color: ColorRes.black,
                    ),
                    sizedBoxH(20),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: ColorRes.black, fontSize: 14, height: 1.5, fontFamily: 'Rubik'),
                        children: [
                          TextSpan(text: "If you are sure you want to proceed, "),
                          TextSpan(text: "Enter the 6-digit code sent to your registered email (ha***12@gmail.com)", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    sizedBoxH(30),
                    const GlobalText(
                      str: "Enter OTP",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    sizedBoxH(15),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) => _buildOtpBox(index)),
                    ),
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => GlobalButtonWidget(
                str: "Delete Account",
                onTap: controller.isLoading.value ? () {} : () => controller.deleteAccount(),
                buttomColor: ColorRes.appButtonColor,
                textColor: ColorRes.white,
                radius: 30,
                height: 55,
                child: controller.isLoading.value 
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: ColorRes.white, strokeWidth: 2)) 
                    : null,
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: "●",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        onChanged: (value) {
          controller.otpValues[index] = value;
          if (value.isNotEmpty && index < 5) {
            controller.focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            controller.focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
