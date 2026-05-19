import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/constants/app_strings.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class MoreOptionsBottomSheet extends StatelessWidget {
  final VoidCallback onSendTip;
  final VoidCallback onViewProfile;

  const MoreOptionsBottomSheet({
    super.key,
    required this.onSendTip,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle Bar
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          sizedBoxH(25),
          // Profile Info Row
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=micheal"),
              ),
              sizedBoxW(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(
                      str: "Micheal Thomas",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange.shade800, size: 16),
                        const GlobalText(
                          str: " 4.9",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const GlobalText(str: AppStrings.following, fontSize: 13, fontWeight: FontWeight.w500),
                    sizedBoxW(5),
                    const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black54),
                  ],
                ),
              ),
            ],
          ),
          sizedBoxH(20),
          Divider(color: Colors.grey.shade200, thickness: 1),
          sizedBoxH(10),
          // Options List
          _bottomSheetItem(Assets.appIcons.liveVideoIc.tipIc.path, AppStrings.sendATip, onTap: () {
            Get.back();
            onSendTip();
          }),
          _bottomSheetItem(Assets.appIcons.buttomNavIc.profileIc.path, AppStrings.viewProfile, onTap: () {
            Get.back();
            onViewProfile();
          }),
          _bottomSheetItem(Assets.appIcons.liveVideoIc.messageIc.path, AppStrings.message),
          _bottomSheetItem(Assets.appIcons.liveVideoIc.blockIc.path, AppStrings.block),
          _bottomSheetItem(Assets.appIcons.liveVideoIc.reportIc.path, AppStrings.report),
          sizedBoxH(20),
        ],
      ),
    );
  }

  Widget _bottomSheetItem(String iconPath, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: GlobalImageLoader(
                imagePath: iconPath,
                height: 20,
                width: 20,
              ),
            ),
            sizedBoxW(15),
            GlobalText(
              str: label,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
