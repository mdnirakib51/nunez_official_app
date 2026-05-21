import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowersController extends GetxController {
  final searchController = TextEditingController();
  
  // Dummy data for Followers list
  final followersList = <Map<String, String>>[
    {'name': 'James Wilson', 'followers': '1.2k Followers', 'image': 'https://i.pravatar.cc/150?u=11'},
    {'name': 'Sophia Miller', 'followers': '2.5k Followers', 'image': 'https://i.pravatar.cc/150?u=12'},
    {'name': 'Liam Taylor', 'followers': '500 Followers', 'image': 'https://i.pravatar.cc/150?u=13'},
    {'name': 'Isabella Garcia', 'followers': '8.1k Followers', 'image': 'https://i.pravatar.cc/150?u=14'},
    {'name': 'Mia Anderson', 'followers': '3.2k Followers', 'image': 'https://i.pravatar.cc/150?u=15'},
    {'name': 'Ethan Thomas', 'followers': '1.9k Followers', 'image': 'https://i.pravatar.cc/150?u=16'},
    {'name': 'Charlotte Moore', 'followers': '4.3k Followers', 'image': 'https://i.pravatar.cc/150?u=17'},
    {'name': 'William Jackson', 'followers': '6.7k Followers', 'image': 'https://i.pravatar.cc/150?u=18'},
    {'name': 'Amelia White', 'followers': '2.1k Followers', 'image': 'https://i.pravatar.cc/150?u=19'},
  ].obs;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
