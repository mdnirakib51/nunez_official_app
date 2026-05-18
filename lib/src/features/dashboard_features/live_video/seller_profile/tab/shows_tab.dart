import 'package:flutter/material.dart';
import '../../../home/view/widgets/home_item_card.dart';

class ShowsTab extends StatelessWidget {
  const ShowsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.50,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const HomeItemCard();
      },
    );
  }
}
