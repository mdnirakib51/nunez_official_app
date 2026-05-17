import 'package:get/get.dart';

import '../../core_features/on_boarding/view/on_boarding_screen.dart';
import '../../core_features/splash/view/splash_screen.dart';
import '../../features/auth/registration/binding/registration_binding.dart';
import '../../features/auth/registration/view/registration_screen.dart';

class AppRouteKeys {
  AppRouteKeys._();

  static const String splash       = '/';
  static const String onBoarding   = '/on-boarding';
  static const String login        = '/login';
  static const String registration = '/registration';
  static const String forgotPass   = '/forgot-password';
  static const String resetPass    = '/reset-password';
  static const String otp          = '/otp';

  static const String dashboard    = '/dashboard';
  static const String home         = '/home';
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
    // GetPage(name: AppRouteKeys.login, page: () => const LoginScreen()),
    //
    // // ── Main ──
    // GetPage(name: AppRouteKeys.dashboard, page: () => const BottomNavBar()),
    // GetPage(name: AppRouteKeys.home, page: () => const HomeScreen()),
    //
    // // ── Profile ──
    // GetPage(name: AppRouteKeys.profile, page: () => const ProfileScreen()),
    // GetPage(name: AppRouteKeys.editProfile, page: () => const EditProfileScreen()),
  ];
}