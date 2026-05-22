import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

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
          str: "Payment & Shipment",
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
                  _buildSection(
                    icon: Assets.appIcons.liveVideoIc.payCardIc.path,
                    title: "Master Card",
                    subtitle: "Master Card  •  **** **** **** 4321- 4/2030",
                    tags: ["Default Payment Account"],
                  ),
                  sizedBoxH(30),
                  _buildSection(
                    icon: Assets.appIcons.profileIc.shippingAddressIc.path,
                    title: "Hasib r Rahman",
                    subtitle: "123 road, Dhaka Bangladesh",
                    tags: ["Office", "Default Shipping Address"],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                // Handle payment confirmation
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
                  str: "Confirm Payment",
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

  Widget _buildSection({
    required String icon,
    required String title,
    required String subtitle,
    required List<String> tags,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: GlobalImageLoader(
            imagePath: icon,
            height: 24,
            width: 24,
          ),
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
              sizedBoxH(5),
              GlobalText(
                str: subtitle,
                fontSize: 13,
                color: ColorRes.grey,
              ),
              sizedBoxH(10),
              Wrap(
                spacing: 10,
                children: tags.map((tag) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: GlobalText(
                    str: tag,
                    fontSize: 11,
                    color: Colors.orange.shade700,
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
