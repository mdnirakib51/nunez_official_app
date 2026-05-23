import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/constants/colors_resources.dart';
import '../../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../../global/global_widget/global_text.dart';
import '../controller/chat_details_controller.dart';

class ChatDetailsScreen extends StatelessWidget {
  final String userName;
  final String userImage;

  const ChatDetailsScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatDetailsController());

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(userImage),
            ),
            sizedBoxW(10),
            GlobalText(
              str: userName,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              reverse: true, // This makes the list start from the bottom
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: controller.chatMessages.length + 1,
              itemBuilder: (context, index) {
                // If it's the last item in the reversed list, show the date header
                if (index == controller.chatMessages.length) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const GlobalText(
                        str: "Today, 02:45 PM",
                        fontSize: 12,
                        color: ColorRes.grey900,
                      ),
                    ),
                  );
                }
                
                final chat = controller.chatMessages[index];
                return _chatBubble(
                  message: chat['message'],
                  time: chat['time'],
                  isMe: chat['isMe'],
                );
              },
            )),
          ),
          _messageInputField(controller),
        ],
      ),
    );
  }

  Widget _chatBubble({required String message, required String time, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: Get.width * 0.7),
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              gradient: isMe
                  ? const LinearGradient(
                      colors: [Color(0xFFFF570D), Color(0xFF8B2F00)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              color: isMe ? null : Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: isMe ? const Radius.circular(15) : Radius.zero,
                bottomRight: isMe ? Radius.zero : const Radius.circular(15),
              ),
            ),
            child: GlobalText(
              str: message,
              color: isMe ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          GlobalText(
            str: time,
            fontSize: 10,
            color: ColorRes.grey900,
          ),
        ],
      ),
    );
  }

  Widget _messageInputField(ChatDetailsController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.image_outlined, color: Colors.grey.shade400, size: 22),
                  sizedBoxW(10),
                  Expanded(
                    child: TextField(
                      controller: controller.messageController,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizedBoxW(10),
          GestureDetector(
            onTap: () => controller.sendMessage(),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFFF570D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
