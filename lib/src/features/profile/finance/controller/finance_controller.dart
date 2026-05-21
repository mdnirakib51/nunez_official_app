import 'package:get/get.dart';

class FinanceController extends GetxController {
  var availableBalance = 408.00.obs;
  
  var payoutHistory = <Map<String, dynamic>>[
    {
      "type": "Withdrawal",
      "date": "12/12/2026",
      "amount": 408.00,
    },
    {
      "type": "Withdrawal",
      "date": "12/12/2026",
      "amount": 408.00,
    },
  ].obs;

  var transactions = <Map<String, dynamic>>[
    {
      "name": "Jasika Jhonson",
      "orderId": "#123456",
      "amount": 408.00,
      "type": "order",
      "img": "https://i.pravatar.cc/150?u=1",
    },
    {
      "name": "Jhon Doe",
      "orderId": "#123456",
      "amount": 408.00,
      "type": "order",
      "img": "https://i.pravatar.cc/150?u=2",
    },
    {
      "name": "Shariful Islam",
      "amount": 4.00,
      "type": "tips",
      "img": "https://i.pravatar.cc/150?u=3",
    },
  ].obs;
}
