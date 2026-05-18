import 'package:flutter/material.dart';
import '../../../home/view/widgets/home_item_card.dart';

class ShowsTab extends StatefulWidget {
  const ShowsTab({super.key});

  @override
  State<ShowsTab> createState() => _ShowsTabState();
}

class _ShowsTabState extends State<ShowsTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
