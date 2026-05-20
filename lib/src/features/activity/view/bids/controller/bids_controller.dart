import 'package:get/get.dart';

class BidsController extends GetxController {
  var selectedFilter = "All".obs;

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }

  var outbidItems = <Map<String, dynamic>>[
    {
      "title": "Zara Original Hand bag",
      "qty": 40,
      "condition": "Brand New",
      "price": "10.00",
      "statusMessage": "Highest Bid \$40.00",
      "imageUrl": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
      "bottomActionText": "\$25.00",
    },
    {
      "title": "Nike Air Max 270",
      "qty": 1,
      "condition": "Brand New",
      "price": "120.00",
      "statusMessage": "Highest Bid \$150.00",
      "imageUrl": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "bottomActionText": "\$130.00",
    },
  ].obs;

  var winningItems = <Map<String, dynamic>>[
    {
      "title": "Zara Original Hand bag",
      "qty": 40,
      "condition": "Brand New",
      "price": "10.00",
      "date": "Nov 12, 2026",
      "statusMessage": "You won the bid for \$40.00",
      "imageUrl": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
    },
    {
      "title": "Apple Watch Series 7",
      "qty": 1,
      "condition": "Box Open",
      "price": "250.00",
      "date": "Oct 20, 2026",
      "statusMessage": "You won the bid for \$300.00",
      "imageUrl": "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
    },
  ].obs;
}
