
import 'package:flutter/material.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../widgets/home_item_card.dart';
import '../widgets/upcoming_section.dart';

class ToysHobbiesTab extends StatelessWidget {
  const ToysHobbiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH(15),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.50,
            ),
            itemCount: 2, // Dummy count
            itemBuilder: (context, index) {
              return const HomeItemCard();
            },
          ),
          
          const UpcomingSection(),

        ],
      ),
    );
  }
}
