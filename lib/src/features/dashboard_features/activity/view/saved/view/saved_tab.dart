import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/constants/colors_resources.dart';
import '../../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../../global/global_widget/global_text.dart';
import '../../../../home/view/widgets/home_item_card.dart';
import '../controller/saved_controller.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedController());

    return Obx(() {
      if (controller.savedItems.isEmpty) {
        return _buildEmptyState();
      }
      return GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: controller.savedItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.52,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = controller.savedItems[index];
          return HomeItemCard(
            sellerName: item['sellerName'],
            sellerImg: item['sellerImg'],
            title: item['title'],
            category: item['category'],
            time: item['time'],
            showBookmark: true,
          );
        },
      );
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
            sizedBoxH(20),
            const GlobalText(
              str: "No saved items",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(10),
            GlobalText(
              str: "Items you save will appear here for easy access.",
              fontSize: 14,
              color: ColorRes.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
