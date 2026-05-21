import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';

class SetupProfileController extends GetxController {
  // Country Selection
  var selectedCountry = "United States".obs;
  final List<String> countries = [
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
    "Bangladesh",
  ];

  // Gender Selection
  var selectedGender = "".obs; // 'Male', 'Female', 'Non-Binary'

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  // Interests Selection
  final RxList<String> selectedInterests = <String>[].obs;
  final List<Map<String, String>> interests = [
    {"title": "Sneakers & Streetwear", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Sports Cards", "icon": Assets.dummyImg.sneakerDummy.path}, // Using sneaker as placeholder
    {"title": "Pokemon Cards", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Trading Cards Games", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Coins & Money", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Video Games", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Sneakers & Streetwear", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Sneakers & Streetwear", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Sneakers & Streetwear", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Toys & Hobbies", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Comics", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Anime & Manga", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Man's Vintage Clothing", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Electronics", "icon": Assets.dummyImg.sneakerDummy.path},
    {"title": "Sports Memorabilia", "icon": Assets.dummyImg.sneakerDummy.path},
  ];

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  // Sub-Interests Selection
  final RxList<String> selectedSubInterests = <String>[].obs;
  final Map<String, List<String>> subInterestsMap = {
    "Video Games": ["Retro Games", "Modern Games"],
    "Toys & Hobbies": ["Disney", "Funko", "Action Figures", "Diecast", "Funko", "Star wars", "Dolls", "Plush"],
    "Electronics": ["Everyday Electronics", "Cameras & Photography"],
    "Sporting Goods": ["Disney", "Funko", "Action Figures", "Diecast", "Funko", "Star wars", "Dolls", "Plush"],
    "Man's Vintage Clothing": ["Disney", "Funko", "Action Figures", "Diecast", "Funko", "Star wars", "Dolls", "Plush"],
  };

  void toggleSubInterest(String subInterest) {
    if (selectedSubInterests.contains(subInterest)) {
      selectedSubInterests.remove(subInterest);
    } else {
      selectedSubInterests.add(subInterest);
    }
  }

  void updateCountry(String? country) {
    if (country != null) {
      selectedCountry.value = country;
    }
  }
}
