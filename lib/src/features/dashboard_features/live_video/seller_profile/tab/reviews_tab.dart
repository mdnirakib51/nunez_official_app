import 'package:flutter/material.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({super.key});

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 18, backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=irfan")),
                sizedBoxW(10),
                const Expanded(child: GlobalText(str: "Irfan Haider", fontWeight: FontWeight.bold)),
                const GlobalText(str: "02/06/2026", color: ColorRes.grey900, fontSize: 11),
              ],
            ),
            sizedBoxH(10),
            const Row(
              children: [
                GlobalText(str: "4.9 ", fontWeight: FontWeight.bold),
                Icon(Icons.star, color: Colors.orange, size: 16),
              ],
            ),
            sizedBoxH(8),
            const GlobalText(str: "Great Product and Fast Delivery. Thanks", fontSize: 13),
            sizedBoxH(12),
            Row(
              children: [
                _reviewImage("https://images.unsplash.com/photo-1434389677669-e08b4cac3105"),
                sizedBoxW(10),
                _reviewImage("https://images.unsplash.com/photo-1523381210434-271e8be1f52b"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, height: 70, width: 70, fit: BoxFit.cover),
    );
  }
}
