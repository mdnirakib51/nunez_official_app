import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorRes.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const GlobalText(
          str: 'Search',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            // Search Bar
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: ColorRes.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search shop...',
                  hintStyle: const TextStyle(color: ColorRes.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: ColorRes.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, color: ColorRes.black, size: 20),
                    onPressed: () {},
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            sizedBoxH(20),
            const GlobalText(
              str: 'Suggested',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorRes.black,
            ),
            sizedBoxH(15),
            // Suggested List
            _buildSuggestedItem(
              'Micheal Thomas',
              '4.9k Followers',
              'https://randomuser.me/api/portraits/men/1.jpg',
            ),
            sizedBoxH(15),
            _buildSuggestedItem(
              'Micheal Thomas',
              '4.9k Followers',
              'https://randomuser.me/api/portraits/men/2.jpg',
            ),
            Divider(height: 30, thickness: 1, color: ColorRes.grey.withValues(alpha: 0.1)),
            // Search Query Suggestion
            _buildSearchSuggestion('Micheal Clothing'),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedItem(String name, String followers, String imageUrl) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(imageUrl),
        ),
        sizedBoxW(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: name,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorRes.black,
              ),
              GlobalText(
                str: followers,
                fontSize: 12,
                color: ColorRes.grey,
              ),
            ],
          ),
        ),
        const Icon(Icons.north_west, color: ColorRes.black, size: 18),
      ],
    );
  }

  Widget _buildSearchSuggestion(String text) {
    return Row(
      children: [
        const Icon(Icons.search, color: ColorRes.grey, size: 22),
        sizedBoxW(12),
        Expanded(
          child: GlobalText(
            str: text,
            fontSize: 14,
            color: ColorRes.black,
          ),
        ),
        const Icon(Icons.north_west, color: ColorRes.black, size: 18),
      ],
    );
  }
}


