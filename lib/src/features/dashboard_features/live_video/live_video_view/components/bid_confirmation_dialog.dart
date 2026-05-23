import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/constants/app_strings.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class BidConfirmationDialog extends StatelessWidget {
  final int amount;
  final VoidCallback onConfirm;

  const BidConfirmationDialog({
    super.key,
    required this.amount,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GlobalText(
                  str: AppStrings.confirmYourBid,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            sizedBoxH(25),
            const GlobalText(
              str: AppStrings.amount,
              fontSize: 14,
              color: ColorRes.grey900,
            ),
            sizedBoxH(10),
            GlobalText(
              str: "\$${amount.toDouble().toStringAsFixed(2)}",
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(20),
            const GlobalText(
              str: AppStrings.placeBidPrompt,
              fontSize: 14,
              color: Colors.black54,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(25),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ColorRes.indigo.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorRes.indigo.withValues(alpha: 0.1)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: ColorRes.indigo, size: 20),
                  sizedBoxW(10),
                  const Expanded(
                    child: GlobalText(
                      str: AppStrings.paymentChargeInfo,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxH(25),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const GlobalText(str: AppStrings.cancel, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                sizedBoxW(15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      onConfirm();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const GlobalText(str: AppStrings.placeBid, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
