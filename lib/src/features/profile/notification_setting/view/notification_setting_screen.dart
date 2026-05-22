import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool isGeneralNotification = true;
  bool isSound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        ),
        title: const GlobalText(
          str: AppStrings.notificationSetting,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _buildToggleRow(
              title: AppStrings.generalNotification,
              value: isGeneralNotification,
              onChanged: (val) {
                setState(() {
                  isGeneralNotification = val;
                });
              },
            ),
            sizedBoxH(20),
            _buildToggleRow(
              title: AppStrings.sound,
              value: isSound,
              onChanged: (val) {
                setState(() {
                  isSound = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow({required String title, required bool value, required ValueChanged<bool> onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlobalText(
          str: title,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        CupertinoSwitch(
          value: value,
          activeColor: ColorRes.greenAccent,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
