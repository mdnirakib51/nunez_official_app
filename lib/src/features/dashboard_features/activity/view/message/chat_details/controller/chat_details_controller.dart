import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  
  final List<Map<String, dynamic>> chatMessages = [
    {
      "isMe": false,
      "message": "Welcome sir.",
      "time": "02:45 PM"
    },
    {
      "isMe": true,
      "message": "Thank You so much",
      "time": "02:45 PM"
    },
    {
      "isMe": false,
      "message": "Sure sir, Our hotel privacy policy...",
      "time": "02:45 PM"
    },
    {
      "isMe": true,
      "message": "I want to know about your hotel booking policy",
      "time": "02:45 PM"
    },
    {
      "isMe": false,
      "message": "Hlw, Good Morning, How Can i Help you?",
      "time": "02:45 PM"
    },
    {
      "isMe": true,
      "message": "Hi, Good Morning",
      "time": "02:45 PM"
    },
  ].obs;

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      chatMessages.insert(0, {
        "isMe": true,
        "message": messageController.text,
        "time": "02:45 PM", // Real time logic can be added
      });
      messageController.clear();
    }
  }
}
