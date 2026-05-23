import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class SendTipScreen extends StatefulWidget {
  const SendTipScreen({super.key});

  @override
  State<SendTipScreen> createState() => _SendTipScreenState();
}

class _SendTipScreenState extends State<SendTipScreen> {
  int selectedIndex = 0;
  final TextEditingController noteController = TextEditingController();

  final List<Map<String, String>> tipAmounts = [
    {"amount": "\$1.00", "emoji": Assets.appIcons.liveVideoIc.emoji1.path},
    {"amount": "\$5.00", "emoji": Assets.appIcons.liveVideoIc.emoji2.path},
    {"amount": "\$10.00", "emoji": Assets.appIcons.liveVideoIc.emoji3.path},
    {"amount": "\$20.00", "emoji": Assets.appIcons.liveVideoIc.emoji4.path},
    {"amount": "\$50.00", "emoji": Assets.appIcons.liveVideoIc.emoji5.path},
    {"amount": "\$100.00", "emoji": Assets.appIcons.liveVideoIc.emoji6.path},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: AppStrings.sendATip,
        titleColor: Colors.black,
        iconColor: Colors.black,
        backColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(20),
            Center(
              child: GlobalImageLoader(
                imagePath: Assets.appIcons.liveVideoIc.sendATipIc.path,
                height: 120,
                width: 120,
              ),
            ),
            sizedBoxH(30),
            const GlobalText(
              str: AppStrings.chooseTipAmount,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const GlobalText(
              str: AppStrings.hostReceiveInfo,
              fontSize: 12,
              color: ColorRes.grey900,
            ),
            sizedBoxH(20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
              ),
              itemCount: tipAmounts.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey.shade200 : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: isSelected ? Border.all(color: Colors.black, width: 1) : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalImageLoader(
                          imagePath: tipAmounts[index]["emoji"]!,
                          height: 30,
                          width: 30,
                        ),
                        sizedBoxH(8),
                        GlobalText(
                          str: tipAmounts[index]["amount"]!,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            sizedBoxH(30),
            const GlobalText(
              str: AppStrings.addThankYouNote,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            sizedBoxH(10),
            TextField(
              controller: noteController,
              maxLength: 50,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: AppStrings.max50Letter,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                counterText: "",
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            sizedBoxH(100),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            // Add payment logic
            Get.back();
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.orange.shade900,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: const GlobalText(
              str: AppStrings.payNow,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
