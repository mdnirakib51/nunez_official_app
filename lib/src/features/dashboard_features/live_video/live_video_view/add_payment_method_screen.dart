import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../../gen/assets.gen.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: AppStrings.addPaymentMethod,
        titleColor: ColorRes.black,
        iconColor: ColorRes.black,
        backColor: ColorRes.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(20),
            const GlobalText(
              str: AppStrings.paymentMethod,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorRes.black,
            ),
            sizedBoxH(20),
            _paymentOption(
              icon: Assets.appIcons.liveVideoIc.payWithCardIc.path,
              title: AppStrings.payWithCard,
              onTap: () {
                Get.toNamed(AppRouteKeys.paymentCards);
              },
            ),
            sizedBoxH(15),
            _paymentOption(
              icon: Assets.appIcons.liveVideoIc.paypalIc.path,
              title: AppStrings.paypal,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorRes.grey.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: ColorRes.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            GlobalImageLoader(
              imagePath: icon,
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
            sizedBoxW(15),
            Expanded(
              child: GlobalText(
                str: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorRes.black,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: ColorRes.deep200,
            ),
          ],
        ),
      ),
    );
  }
}
