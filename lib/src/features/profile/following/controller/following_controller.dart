import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowingController extends GetxController {
  final searchController = TextEditingController();
  
  // Dummy data for Following list
  final followingList = <Map<String, String>>[
    {'name': 'Noah Jones', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=1'},
    {'name': 'Harry Williams', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=2'},
    {'name': 'Noah Brown', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=3'},
    {'name': 'Oliver Brown', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=4'},
    {'name': 'Harry Jones', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=5'},
    {'name': 'Noah Smith', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=6'},
    {'name': 'Harry Brown', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=7'},
    {'name': 'George Smith', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=8'},
    {'name': 'Noah Williams', 'followers': '3.9k Followers', 'image': 'https://i.pravatar.cc/150?u=9'},
  ].obs;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
