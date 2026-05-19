
import 'package:get/get.dart';
import '../../../../../../../gen/assets.gen.dart';

class CategorySelectionController extends GetxController {
  var selectedCategory = 0.obs;

  final List<Map<String, String>> categories = [
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

  void selectCategory(int index) {
    selectedCategory.value = index;
  }
}
