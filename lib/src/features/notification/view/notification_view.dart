
import 'package:flutter/material.dart';
import '../../../global/components/global_appbar.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_sized_box.dart';
import '../../../global/global_widget/global_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        "title": "Booking Confirmation",
        "subtitle": "Your booking request has been confirmed",
        "time": "8: 20 AM",
        "image": "https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg"
      },
      {
        "title": "Payment Successful",
        "subtitle": "Your payment has been successfully done.",
        "time": "8: 20 AM",
        "image": "https://cdn-icons-png.flaticon.com/512/10149/10149458.png"
      },
      {
        "title": "Enjoy 30% off",
        "subtitle": "Enjoy Up to 30% off in Santa Maria Resort",
        "time": "8: 20 AM",
        "image": "https://cdn-icons-png.flaticon.com/512/10473/10473615.png"
      },
      {
        "title": "Santa Maria resort sent you a message",
        "subtitle": "Enjoy Up to 30% off in Santa Maria Resort",
        "time": "8: 20 AM",
        "image": "https://cdn-icons-png.flaticon.com/512/3669/3669970.png"
      },
      {
        "title": "Booking Confirmation",
        "subtitle": "Your booking request has been confirmed",
        "time": "8: 20 AM",
        "image": "https://img.freepik.com/free-photo/beautiful-luxury-outdoor-swimming-pool-hotel-resort_74190-7433.jpg"
      },
      {
        "title": "Payment Successful",
        "subtitle": "Your payment has been successfully done.",
        "time": "8: 20 AM",
        "image": "https://cdn-icons-png.flaticon.com/512/10149/10149458.png"
      },
      {
        "title": "Enjoy 30% off",
        "subtitle": "Enjoy Up to 30% off in Santa Maria Resort",
        "time": "8: 20 AM",
        "image": "https://cdn-icons-png.flaticon.com/512/10473/10473615.png"
      },
    ];

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Notification",
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(color: ColorRes.white200, height: 30),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(item['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sizedBoxW(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GlobalText(
                            str: item['title']!,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GlobalText(
                          str: item['time']!,
                          fontSize: 12,
                          color: ColorRes.grey,
                        ),
                      ],
                    ),
                    sizedBoxH(4),
                    GlobalText(
                      str: item['subtitle']!,
                      fontSize: 12,
                      color: ColorRes.grey,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
