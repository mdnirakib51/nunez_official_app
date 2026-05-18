import 'package:flutter/material.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  index == 0
                      ? "https://images.unsplash.com/photo-1523275335684-37898b6baf30"
                      : index == 1
                          ? "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
                          : index == 2
                              ? "https://images.unsplash.com/photo-1572635196237-14b3f281503f"
                              : "https://images.unsplash.com/photo-1485955900006-10f4d324d411",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            sizedBoxH(8),
            const GlobalText(
              str: "Luxury Product Item",
              fontSize: 13,
              fontWeight: FontWeight.bold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            sizedBoxH(4),
            Row(
              children: [
                const GlobalText(
                  str: "\$120.00",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 14),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
