import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for Tips
    final List<Map<String, dynamic>> tipsData = [
      {
        "name": "Sharifa Sahrin",
        "img": "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
        "amount": 408.00,
        "type": "Tips"
      },
      {
        "name": "Ariful islam",
        "img": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d",
        "amount": 408.00,
        "type": "Tips"
      },
      {
        "name": "Shariful Islam",
        "img": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
        "amount": 4.00,
        "type": "Tips"
      },
    ];

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: "Tips",
        isBackIc: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.search, color: ColorRes.grey, size: 22),
                  sizedBoxW(10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: ColorRes.grey, fontSize: 14),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tips List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: tipsData.length,
              separatorBuilder: (context, index) => sizedBoxH(15),
              itemBuilder: (context, index) {
                final item = tipsData[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(item['img']),
                      ),
                      sizedBoxW(15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              str: item['name'],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            sizedBoxH(4),
                            const GlobalText(
                              str: "Tips",
                              fontSize: 12,
                              color: ColorRes.green,
                            ),
                          ],
                        ),
                      ),
                      GlobalText(
                        str: "\$${item['amount'].toStringAsFixed(2)}",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.appButtonColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
