import 'package:flutter/material.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../widgets/home_item_card.dart';

class FashionTab extends StatelessWidget {
  const FashionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH(10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.58,
            ),
            itemCount: 6, // Dummy count
            itemBuilder: (context, index) {
              return const HomeItemCard(category: "Fashion");
            },
          ),
        ],
      ),
    );
  }
}
