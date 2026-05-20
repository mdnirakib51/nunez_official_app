import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import '../chat_details/view/chat_details_screen.dart';
import '../controller/message_controller.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessageController());

    return Obx(() {
      if (controller.messages.isEmpty) {
        return _buildEmptyState();
      }
      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: controller.messages.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade200,
          height: 1,
          indent: 15,
          endIndent: 15,
        ),
        itemBuilder: (context, index) {
          final message = controller.messages[index];
          return InkWell(
            onTap: () => Get.to(() => ChatDetailsScreen(
                  userName: message['name']!,
                  userImage: message['image']!,
                )),
            child: _messageItem(
              name: message['name']!,
              text: message['message']!,
              time: message['time']!,
              image: message['image']!,
            ),
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
            GlobalImageLoader(
              imagePath: Assets.requiredSrc.emptyIc.path,
              height: 100,
              width: 100,
            ),
            sizedBoxH(20),
            const GlobalText(
              str: "No messages yet",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(10),
            GlobalText(
              str: "When you start a conversation, it will appear here.",
              fontSize: 14,
              color: ColorRes.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageItem({
    required String name,
    required String text,
    required String time,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image),
          ),
          sizedBoxW(12),
          // Name and Message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: name,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                sizedBoxH(4),
                GlobalText(
                  str: text,
                  fontSize: 13,
                  color: ColorRes.grey,
                ),
              ],
            ),
          ),
          // Time
          GlobalText(
            str: time,
            fontSize: 12,
            color: ColorRes.grey,
          ),
        ],
      ),
    );
  }
}
