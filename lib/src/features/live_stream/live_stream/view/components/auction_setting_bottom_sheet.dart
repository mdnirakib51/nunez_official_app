import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../../controller/live_stream_controller.dart';

class AuctionSettingBottomSheet extends GetView<LiveStreamController> {
  const AuctionSettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: ColorRes.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          sizedBoxH(20),
          const Center(
            child: GlobalText(
              str: "Auction Setting",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizedBoxH(20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(str: "Starting Bid Amount", fontSize: 14, fontWeight: FontWeight.w500),
                    sizedBoxH(8),
                    _buildTextField("\$1.00"),
                  ],
                ),
              ),
              sizedBoxW(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(str: "Max Bid Amount", fontSize: 14, fontWeight: FontWeight.w500),
                    sizedBoxH(8),
                    _buildTextField("\$100.00"),
                  ],
                ),
              ),
            ],
          ),
          sizedBoxH(20),
          const GlobalText(str: "Bid Required Time", fontSize: 14, fontWeight: FontWeight.w500),
          sizedBoxH(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: ColorRes.grey.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: "15 Sec",
                items: ["15 Sec", "30 Sec", "1 Min"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          sizedBoxH(20),
          const GlobalText(str: "Counter Bid Time", fontSize: 14, fontWeight: FontWeight.w500),
          const GlobalText(
            str: "When auction has less than 5 seconds remaining, new bids will reset the timer to the selected amount",
            fontSize: 12,
            color: ColorRes.grey,
          ),
          sizedBoxH(10),
          Obx(() => Wrap(
                spacing: 10,
                children: ["5s", "10s", "15s", "20s", "30s", "1m"].map((time) {
                  bool isSelected = controller.selectedCounterTime.value == time;
                  return GestureDetector(
                    onTap: () => controller.selectedCounterTime.value = time,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? ColorRes.black.withValues(alpha: 0.8) : ColorRes.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GlobalText(
                        str: time,
                        color: isSelected ? ColorRes.white : ColorRes.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              )),
          sizedBoxH(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(str: "Sudden Death", fontSize: 14, fontWeight: FontWeight.w500),
                  GlobalText(
                    str: "This means when you're down to 00:01, the\nlast person to bid wins!",
                    fontSize: 11,
                    color: ColorRes.grey,
                  ),
                ],
              ),
              Obx(() => Switch(
                    value: controller.isSuddenDeath.value,
                    onChanged: (val) => controller.isSuddenDeath.value = val,
                    activeColor: Colors.orange,
                  )),
            ],
          ),
          sizedBoxH(30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRes.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const GlobalText(str: "Cancel", color: ColorRes.white, fontWeight: FontWeight.bold),
                ),
              ),
              sizedBoxW(15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade900,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const GlobalText(str: "Starts Auction", color: ColorRes.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          sizedBoxH(20),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ColorRes.grey.withValues(alpha: 0.3))),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
