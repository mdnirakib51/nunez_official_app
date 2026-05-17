import 'package:get/get.dart';
import 'app_route.dart';

class AppNavigator {
  AppNavigator._();

  // ── Push ──────────────────────────────────────
  static void push(String routeName, {dynamic arguments}) {
    Get.toNamed(routeName, arguments: arguments);
  }

  static void pushReplace(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  static void pushAndRemoveAll(String routeName, {dynamic arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  // ── Pop ───────────────────────────────────────

  static void pop({dynamic result}) {
    Get.back(result: result);
  }

  static bool canPop() => Get.key.currentState?.canPop() ?? false;

  // ── Arguments ─────────────────────────────────
  static dynamic get arguments => Get.arguments;

  // ── Shortcuts ─────────────────────────────────

  static void goToLogin()      => Get.offAllNamed(AppRouteKeys.login);
  static void goToHome()       => Get.offAllNamed(AppRouteKeys.home);
  static void goToOnBoarding() => Get.offAllNamed(AppRouteKeys.onBoarding);
  static void goToDashboard()  => Get.offAllNamed(AppRouteKeys.dashboard);

}