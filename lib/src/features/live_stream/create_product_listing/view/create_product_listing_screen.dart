import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/create_product_listing_controller.dart';

class CreateProductListingScreen extends GetView<CreateProductListingController> {
  const CreateProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Create Product Listing",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(10),
                    // Add Product Image Placeholder
                    GestureDetector(
                      onTap: () {
                        // Image picker logic
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: ColorRes.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.appIcons.liveVideoIc.addProductIc.path,
                              height: 40,
                              width: 40,
                              color: ColorRes.grey,
                            ),
                            sizedBoxH(10),
                            const GlobalText(
                              str: "Add Product",
                              color: ColorRes.grey900,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxH(20),

                    // Product Title
                    GlobalTextFormField(
                      controller: controller.productTitleController,
                      titleText: "Product Title",
                      hintText: "Enter title",
                      decoration: borderDecoration,
                    ),
                    sizedBoxH(15),

                    // Category Dropdown
                    const GlobalText(
                      str: "Category",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    sizedBoxH(5),
                    Obx(() => _buildDropdown(
                      value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                      hint: "Select category",
                      items: controller.categories,
                      onChanged: controller.setCategory,
                    )),
                    sizedBoxH(15),

                    // Product Quality Dropdown
                    const GlobalText(
                      str: "Product Quality",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    sizedBoxH(5),
                    Obx(() => _buildDropdown(
                      value: controller.selectedQuality.value,
                      items: controller.qualities,
                      onChanged: controller.setQuality,
                    )),
                    sizedBoxH(15),

                    // Product Weight Dropdown
                    const GlobalText(
                      str: "Product Weight",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    sizedBoxH(5),
                    Obx(() => _buildDropdown(
                      value: controller.selectedWeight.value,
                      items: controller.weights,
                      onChanged: controller.setWeight,
                    )),
                    sizedBoxH(15),

                    // Available Quantity Dropdown
                    const GlobalText(
                      str: "Available Quantity",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    sizedBoxH(5),
                    Obx(() => _buildDropdown(
                      value: controller.selectedQuantity.value,
                      items: controller.quantities,
                      onChanged: controller.setQuantity,
                    )),
                    sizedBoxH(20),

                    // Free Shipping Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(
                          str: "Free shipping",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        Obx(() => Switch(
                          value: controller.isFreeShipping.value,
                          onChanged: controller.toggleFreeShipping,
                          activeColor: ColorRes.white,
                          activeTrackColor: ColorRes.appButtonColor,
                        )),
                      ],
                    ),
                    sizedBoxH(15),

                    // Description
                    GlobalTextFormField(
                      controller: controller.descriptionController,
                      titleText: "Description",
                      hintText: "Write here",
                      maxLines: 5,
                      decoration: borderDecoration,
                    ),
                    sizedBoxH(30),
                  ],
                ),
              ),
            ),
          ),
          
          // Next Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlobalButtonWidget(
              str: "Next",
              onTap: controller.submit,
              buttomColor: ColorRes.appButtonColor,
              radius: 30,
              height: 55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    String? hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorRes.white200.withValues(alpha: 0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: hint != null ? GlobalText(str: hint, color: ColorRes.white200, fontSize: 12) : null,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: ColorRes.grey),
          dropdownColor: ColorRes.white,
          borderRadius: BorderRadius.circular(8),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: GlobalText(str: item, fontSize: 12, color: ColorRes.black),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
