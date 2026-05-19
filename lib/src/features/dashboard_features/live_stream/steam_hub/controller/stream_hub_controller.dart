import 'package:get/get.dart';

class StreamHubController extends GetxController {
  var scheduledShows = <Map<String, dynamic>>[
    {
      "name": "Asadur Yead",
      "title": "500 Items Starts \$1 Electronics General Items",
      "category": "Electronics",
      "time": "Tomorrow,\n10:30 PM",
      "isFreeShipping": true,
    },
    {
      "name": "Asadur Yead",
      "title": "500 Items Starts \$1 Electronics General Items",
      "category": "Electronics",
      "time": "Today,\n10:30 PM",
      "isFreeShipping": true,
    },
  ].obs;
}
