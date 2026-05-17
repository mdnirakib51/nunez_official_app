import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    // TODO: Auth check logic এখানে
    // final isLoggedIn = await AuthService.isLoggedIn();
    // if (isLoggedIn) {
    //   Get.offAllNamed(AppRouteKeys.dashboard);
    // } else {
    //   Get.offAllNamed(AppRouteKeys.onBoarding);
    // }

    Get.offAllNamed(AppRouteKeys.onBoarding);
  }
}