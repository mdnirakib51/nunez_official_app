import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/constants/app_strings.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class CustomBidDialog extends StatefulWidget {
  final int currentBid;
  final Function(int) onBidPlaced;

  const CustomBidDialog({
    super.key,
    required this.currentBid,
    required this.onBidPlaced,
  });

  @override
  State<CustomBidDialog> createState() => _CustomBidDialogState();
}

class _CustomBidDialogState extends State<CustomBidDialog> {
  final TextEditingController _bidController = TextEditingController();

  @override
  void dispose() {
    _bidController.dispose();
    super.dispose();
  }

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
                  str: AppStrings.placeCustomBid,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            sizedBoxH(20),
            const GlobalText(
              str: AppStrings.enterAmount,
              fontSize: 14,
              color: Colors.grey,
            ),
            sizedBoxH(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _bidController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: "0.00",
                  prefixText: "\$ ",
                  border: InputBorder.none,
                ),
              ),
            ),
            sizedBoxH(20),
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
                  Expanded(
                    child: GlobalText(
                      str: "${AppStrings.bidHigherPrompt} of \$${widget.currentBid}",
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
                      final amount = int.tryParse(_bidController.text);
                      if (amount != null && amount > widget.currentBid) {
                        Get.back();
                        widget.onBidPlaced(amount);
                      } else {
                        Get.snackbar(AppStrings.invalidBid, AppStrings.amountGreaterThanCurrent);
                      }
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
