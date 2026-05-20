import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/sales_format_controller.dart';

class SalesFormatScreen extends GetView<SalesFormatController> {
  const SalesFormatScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(20),
                    const GlobalText(
                      str: "Choose sales format",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    sizedBoxH(10),
                    const GlobalText(
                      str: "Set a starting price you’re comfortable wirh that will get buyers interested. Lower starting prices encourages more people to bid & buy.",
                      fontSize: 14,
                      color: ColorRes.deep200,
                    ),
                    sizedBoxH(25),

                    // Sales Format Toggle (Auction / Buy it Now)
                    Obx(() => Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorRes.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildFormatButton("Auction"),
                          ),
                          Expanded(
                            child: _buildFormatButton("Buy it Now"),
                          ),
                        ],
                      ),
                    )),
                    sizedBoxH(25),

                    // Conditional Fields based on Sales Format
                    Obx(() => controller.salesFormat.value == 'Auction'
                        ? Column(
                            children: [
                              // Bid Start From
                              GlobalTextFormField(
                                controller: controller.bidStartController,
                                titleText: "Bid Start From",
                                hintText: "Enter amount",
                                decoration: borderDecoration,
                                keyboardType: TextInputType.number,
                              ),
                              sizedBoxH(20),

                              // Set Date & Time
                              GlobalTextFormField(
                                controller: controller.dateTimeController,
                                titleText: "Set Date & Time",
                                hintText: "Select Date & Time",
                                readOnly: true,
                                decoration: borderDecoration.copyWith(
                                  suffixIcon: const Icon(Icons.calendar_today_outlined, size: 20, color: ColorRes.black),
                                ),
                                onChanged: (v) {}, // Prevent text input
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: controller.regularPriceController,
                                      titleText: "Regular Price",
                                      hintText: "Enter price",
                                      decoration: borderDecoration,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  sizedBoxW(15),
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: controller.discountPriceController,
                                      titleText: "Discount Price",
                                      hintText: "Enter price",
                                      decoration: borderDecoration,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    sizedBoxH(25),

                    // Free Shipping Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(
                          str: "Free shipping",
                          fontSize: 16,
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
              onTap: ()=> Get.toNamed(AppRouteKeys.previewListing),
              buttomColor: ColorRes.appButtonColor,
              radius: 30,
              height: 55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormatButton(String format) {
    bool isSelected = controller.salesFormat.value == format;
    return GestureDetector(
      onTap: () => controller.setSalesFormat(format),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? ColorRes.dark : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: GlobalText(
          str: format,
          color: isSelected ? ColorRes.white : ColorRes.black,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
