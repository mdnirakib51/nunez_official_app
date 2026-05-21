import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/shipping_address_controller.dart';

class AddShippingAddressView extends StatelessWidget {
  const AddShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShippingAddressController>();
    final isEdit = Get.arguments != null;

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Shipping Address",
        isBackIc: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Address Category"),
            sizedBoxH(8),
            _buildDropdownField("Home"),
            sizedBoxH(20),
            _buildLabel("Recipient's Name"),
            sizedBoxH(8),
            _buildTextField("Enter name"),
            sizedBoxH(20),
            _buildLabel("Country"),
            sizedBoxH(8),
            _buildTextField("Enter your country"),
            sizedBoxH(20),
            _buildLabel("Address"),
            sizedBoxH(8),
            _buildTextField("Enter your address"),
            sizedBoxH(20),
            _buildLabel("Phone Number"),
            sizedBoxH(8),
            _buildTextField("Enter your phone number"),
            sizedBoxH(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("City"),
                      sizedBoxH(8),
                      _buildTextField("Enter City"),
                    ],
                  ),
                ),
                sizedBoxW(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Post/ZIP Code"),
                      sizedBoxH(8),
                      _buildTextField("1234"),
                    ],
                  ),
                ),
              ],
            ),
            sizedBoxH(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GlobalText(
                  str: "Default Shipping Address",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Obx(() => Switch(
                  value: controller.isDefault.value,
                  onChanged: (value) => controller.toggleDefault(value),
                  activeColor: const Color(0xFF42D06B),
                )),
              ],
            ),
            sizedBoxH(40),
            if (isEdit) ...[
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F2F2),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                    sizedBoxW(8),
                    const GlobalText(
                      str: "Delete Address",
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              sizedBoxH(15),
            ],
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorRes.appButtonColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const GlobalText(
                str: "Save Changes",
                color: ColorRes.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBoxH(20),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return GlobalText(
      str: label,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorRes.black,
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: ColorRes.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: ColorRes.grey),
          items: [value].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: GlobalText(str: item, fontSize: 14, color: ColorRes.grey),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
