import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../../gen/assets.gen.dart';

class PaymentAndShippingView extends StatelessWidget {
  const PaymentAndShippingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Payment and shipping",
        isBackIc: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildOption(
              icon: Assets.appIcons.liveVideoIc.payCardIc.path,
              title: "Add Payment Method",
              subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
              onTap: () => Get.toNamed(AppRouteKeys.addPaymentMethod),
            ),
            sizedBoxH(25),
            _buildOption(
              icon: Assets.appIcons.profileIc.shippingAddressIc.path,
              title: "Add Shipping Address",
              subtitle: "123 road, Dhaka Bangladesh",
              onTap: () => Get.toNamed(AppRouteKeys.shippingAddress, arguments: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          GlobalImageLoader(
            imagePath: icon,
            height: 24,
            width: 24,
          ),
          sizedBoxW(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                sizedBoxH(4),
                GlobalText(
                  str: subtitle,
                  fontSize: 13,
                  color: ColorRes.grey,
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18, color: ColorRes.grey),
        ],
      ),
    );
  }
}
