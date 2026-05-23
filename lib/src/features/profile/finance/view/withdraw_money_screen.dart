import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class WithdrawMoneyScreen extends StatefulWidget {
  const WithdrawMoneyScreen({super.key});

  @override
  State<WithdrawMoneyScreen> createState() => _WithdrawMoneyScreenState();
}

class _WithdrawMoneyScreenState extends State<WithdrawMoneyScreen> {
  int selectedAccountIndex = 0;

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
          str: "Withdraw Money",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  sizedBoxH(20),
                  const GlobalText(
                    str: "Amount",
                    fontSize: 14,
                    color: ColorRes.grey,
                  ),
                  sizedBoxH(10),
                  const GlobalText(
                    str: "\$150.00",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  sizedBoxH(40),
                  const GlobalText(
                    str: "\$50.00",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const GlobalText(
                    str: "Available Balance",
                    fontSize: 14,
                    color: ColorRes.grey,
                  ),
                  sizedBoxH(50),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: GlobalText(
                      str: "Choose Account",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  sizedBoxH(20),
                  _accountItem(
                    index: 0,
                    title: "Master Card",
                    subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
                    icon: Assets.appIcons.liveVideoIc.payCardIc.path,
                  ),
                  sizedBoxH(15),
                  _accountItem(
                    index: 1,
                    title: "Visa card",
                    subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
                    icon: Assets.appIcons.liveVideoIc.payCardIc.path,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const GlobalText(
                  str: "Confirm Withdraw",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          sizedBoxH(10),
        ],
      ),
    );
  }

  Widget _accountItem({
    required int index,
    required String title,
    required String subtitle,
    required String icon,
  }) {
    bool isSelected = selectedAccountIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAccountIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            GlobalImageLoader(
              imagePath: icon,
              height: 25,
              width: 25,
              fit: BoxFit.contain,
            ),
            sizedBoxW(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: title,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  sizedBoxH(4),
                  GlobalText(
                    str: subtitle,
                    fontSize: 12,
                    color: ColorRes.grey900,
                  ),
                ],
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey.shade400,
                  width: isSelected ? 7 : 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
