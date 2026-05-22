import 'package:flutter/material.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';

class PaymentCardsScreen extends StatefulWidget {
  const PaymentCardsScreen({super.key});

  @override
  State<PaymentCardsScreen> createState() => _PaymentCardsScreenState();
}

class _PaymentCardsScreenState extends State<PaymentCardsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: AppStrings.addPaymentMethod,
        titleColor: ColorRes.black,
        iconColor: ColorRes.black,
        backColor: ColorRes.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.addNewCard),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add_card, color: ColorRes.black, size: 22),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                _cardOption(
                  index: 0,
                  icon: Assets.appIcons.liveVideoIc.payCardIc.path,
                  title: AppStrings.masterCard,
                  subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
                ),
                sizedBoxH(15),
                _cardOption(
                  index: 1,
                  icon: Assets.appIcons.liveVideoIc.payCardIc.path,
                  title: AppStrings.visaCard,
                  subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlobalButtonWidget(
              str: AppStrings.save,
              radius: 30,
              height: 55,
              onTap: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardOption({
    required int index,
    required String icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            GlobalImageLoader(
              imagePath: icon,
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            sizedBoxW(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: title,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorRes.black,
                  ),
                  sizedBoxH(4),
                  GlobalText(
                    str: subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.grey,
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
                  color: isSelected ? ColorRes.appColor : ColorRes.grey,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorRes.appColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
