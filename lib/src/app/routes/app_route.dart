
import 'package:get/get.dart';
import '../../features/dashboard_features/home/binding/home_binding.dart';
import '../../global/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import '../../global/bottom_nav_bar/view/bottom_nav_bar.dart';
import '../../core_features/other/congratulations_screen.dart';
import '../../core_features/on_boarding/view/on_boarding_screen.dart';
import '../../core_features/splash/view/splash_screen.dart';
import '../../features/auth/forgot/binding/forgot_binding.dart';
import '../../features/auth/forgot/view/forgot_password_scree.dart';
import '../../features/auth/forgot/view/forgot_verification_screen.dart';
import '../../features/auth/forgot/view/set_new_password_screen.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/view/login_screen.dart';
import '../../features/auth/registration/binding/registration_binding.dart';
import '../../features/auth/registration/view/registration_screen.dart';
import '../../features/auth/verification/binding/verification_binding.dart';
import '../../features/auth/verification/view/verification_screen.dart';

class AppRouteKeys {
  AppRouteKeys._();

  static const String splash       = '/';
  static const String onBoarding   = '/on-boarding';
  static const String login        = '/login';
  static const String registration = '/registration';
  static const String forgotPass   = '/forgot-password';
  static const String forgotOtp    = '/forgot-otp';
  static const String resetPass    = '/reset-password';
  static const String congratulation = '/other';
  static const String otp          = '/otp';

  static const String dashboard    = '/dashboard';
  static const String home         = '/dashboard_features';
  static const String notification = '/notification';
  static const String settings     = '/settings';

  static const String profileMenu  = '/profileMenu';
  static const String profile      = '/profile';
  static const String editProfile  = '/edit-profile';
}

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [

    // ── Start ──
    GetPage(name: AppRouteKeys.splash, page: () => const SplashScreen()),
    GetPage(name: AppRouteKeys.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: AppRouteKeys.registration, page: () => const RegistrationScreen(), binding: RegistrationBinding()),
    GetPage(name: AppRouteKeys.login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: AppRouteKeys.forgotPass, page: () => const ForgotPassScreen(), binding: ForgotBinding()),
    GetPage(name: AppRouteKeys.forgotOtp, page: () => const ForgotVerificationScreen(), binding: ForgotBinding()),
    GetPage(name: AppRouteKeys.resetPass, page: () => const SetNewPasswordScreen(), binding: ForgotBinding()),
    GetPage(
      name: AppRouteKeys.congratulation,
      page: () => CongratulationsScreen(
        title: Get.arguments['title'] ?? '',
        subTitle: Get.arguments['subTitle'] ?? '',
        onTap: Get.arguments['onTap'] ?? () {},
      ),
    ),
    GetPage(name: AppRouteKeys.otp, page: () => const VerificationScreen(), binding: VerificationBinding()),
    
    // ── Main ──
    GetPage(
      name: AppRouteKeys.dashboard,
      page: () => const BottomNavBar(),
      bindings: [
        BottomNavBarBinding(),
        HomeBinding(),
      ],
    ),
  ];
}