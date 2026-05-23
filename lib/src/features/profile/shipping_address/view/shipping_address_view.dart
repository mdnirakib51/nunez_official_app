import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../app/routes/app_route.dart';
import '../controller/shipping_address_controller.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/global_widget/global_image_loader.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShippingAddressController());

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Shipping Address",
        isBackIc: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.addresses.length,
              separatorBuilder: (context, index) => sizedBoxH(20),
              itemBuilder: (context, index) {
                final address = controller.addresses[index];
                return _buildAddressItem(address, controller);
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRouteKeys.addShippingAddress),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorRes.appButtonColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const GlobalText(
                str: "Add Address",
                color: ColorRes.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          sizedBoxH(10),
        ],
      ),
    );
  }

  Widget _buildAddressItem(Map<String, dynamic> address, ShippingAddressController controller) {
    bool isSelected = controller.selectedAddressId.value == address['id'];
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Shipping Icon
        Container(
          padding: const EdgeInsets.all(10),
          child: GlobalImageLoader(
            imagePath: Assets.appIcons.profileIc.shippingAddressIc.path,
            height: 24,
            width: 24,
          ),
        ),
        sizedBoxW(10),
        // Address Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: address['name'],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              sizedBoxH(4),
              GlobalText(
                str: address['address'],
                fontSize: 13,
                color: ColorRes.grey900,
              ),
              sizedBoxH(8),
              Row(
                children: [
                  _badge(address['category'], ColorRes.white, ColorRes.grey, border: true),
                  if (address['isDefault']) ...[
                    sizedBoxW(10),
                    _badge("Default Shipping Address", const Color(0xFFFFEFE6), const Color(0xFFFF823C)),
                  ],
                ],
              ),
            ],
          ),
        ),
        // Action: Radio or Edit
        Obx(() => controller.isFromSettings.value
            ? IconButton(
                onPressed: () => Get.toNamed(AppRouteKeys.addShippingAddress, arguments: address),
                icon: const Icon(Icons.edit_outlined, color: ColorRes.black),
              )
            : Radio<String>(
                value: address['id'],
                groupValue: controller.selectedAddressId.value,
                onChanged: (value) {
                  controller.selectAddress(value!);
                },
                activeColor: ColorRes.appButtonColor,
              )),
      ],
    );
  }

  Widget _badge(String label, Color bgColor, Color textColor, {bool border = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: border ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: GlobalText(
        str: label,
        fontSize: 11,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
