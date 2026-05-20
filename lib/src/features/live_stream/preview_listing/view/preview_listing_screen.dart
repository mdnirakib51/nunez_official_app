import '../../../dashboard_features/home/view/widgets/home_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/preview_listing_controller.dart';

class PreviewListingScreen extends GetView<PreviewListingController> {
  const PreviewListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: "",
        iconColor: ColorRes.black,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, color: ColorRes.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GlobalText(
                    str: "Here’s the preview for your\nshow",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  sizedBoxH(10),
                  const GlobalText(
                    str: "This is how the show will appear to buyers, You can edit the details later.",
                    fontSize: 14,
                    color: ColorRes.deep200,
                  ),
                  sizedBoxH(40),

                  // Preview Card
                  Center(
                    child: Container(
                      width: Get.width * 0.7,
                      height: 450,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const AbsorbPointer(
                        child: HomeItemCard(
                          sellerName: "Rafsan Jamil",
                          time: "Tomorrow, 10:30 PM",
                          title: "500 Items Starts \$1 Electronics General Items",
                          category: "Sneakers",
                          isFreeShipping: true,
                          showBookmark: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Finish Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlobalButtonWidget(
              str: "Finish",
              onTap: () => controller.finish(),
              buttomColor: ColorRes.appButtonColor,
              radius: 30,
              height: 55,
            ),
          ),
        ],
      ),
    );
  }
}
