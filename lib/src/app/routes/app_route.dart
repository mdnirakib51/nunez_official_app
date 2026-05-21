
import 'package:get/get.dart';
import '../../features/activity/view/purchase/order_summary/view/order_summary_screen.dart';
import '../../features/categories/view/category_product_screen.dart';
import '../../features/dashboard_features/search/view/search_screen.dart';
import '../../features/dashboard_features/live_video/seller_profile/binding/seller_profile_binding.dart';
import '../../features/dashboard_features/live_video/seller_profile/seller_profile_screen.dart';
import '../../features/dashboard_features/live_video/seller_profile/product_details_screen.dart';
import '../../features/dashboard_features/live_video/live_video_view/payment_cards_screen.dart';
import '../../features/dashboard_features/live_video/live_video_view/add_new_card_screen.dart';
import '../../features/dashboard_features/live_video/live_video_view/add_payment_method_screen.dart';
import '../../features/dashboard_features/live_video/live_video_view/send_tip_screen.dart';
import '../../features/dashboard_features/live_video/live_video_view/live_video_screen.dart';
import '../../features/dashboard_features/home/binding/home_binding.dart';
import '../../features/live_stream/category_selection/binding/category_selection_binding.dart';
import '../../features/live_stream/category_selection/view/category_selection_screen.dart';
import '../../features/live_stream/live_stream/binding/live_stream_binding.dart';
import '../../features/live_stream/live_stream/view/live_stream_view.dart';
import '../../features/live_stream/preview_listing/binding/preview_listing_binding.dart';
import '../../features/live_stream/preview_listing/view/preview_listing_screen.dart';
import '../../features/live_stream/sales_format/binding/sales_format_binding.dart';
import '../../features/live_stream/sales_format/view/sales_format_screen.dart';
import '../../features/live_stream/create_product_listing/binding/create_product_listing_binding.dart';
import '../../features/live_stream/create_product_listing/view/create_product_listing_screen.dart';
import '../../features/live_stream/create_listing/binding/create_listing_binding.dart';
import '../../features/live_stream/create_listing/view/create_listing_screen.dart';
import '../../features/live_stream/seller_description/binding/seller_description_binding.dart';
import '../../features/live_stream/seller_description/view/seller_description_screen.dart';
import '../../features/live_stream/seller_guide/binding/seller_guide_binding.dart';
import '../../features/live_stream/seller_guide/view/seller_guide_screen.dart';
import '../../features/live_stream/steam_hub/binding/stream_hub_binding.dart';
import '../../features/live_stream/steam_hub/view/stream_hub_view.dart';
import '../../features/live_stream/sub_category_selection/binding/sub_category_selection_binding.dart';
import '../../features/live_stream/sub_category_selection/view/sub_category_selection_screen.dart';
import '../../features/profile/orders/view/orders_view.dart';
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
import '../../features/profile/edit_profile/binding/edit_profile_binding.dart';
import '../../features/profile/edit_profile/view/edit_profile_screen.dart';
import '../../features/profile/finance/binding/finance_binding.dart';
import '../../features/profile/finance/view/finance_view.dart';
import '../../features/profile/orders/binding/orders_binding.dart';
import '../../features/profile/sales_analytics/binding/sales_analytics_binding.dart';
import '../../features/profile/sales_analytics/view/sales_analytics_view.dart';
import '../../features/profile/inventory/binding/inventory_binding.dart';
import '../../features/profile/inventory/view/inventory_screen.dart';

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
  static const String inventory    = '/inventory';
  static const String sellerProfile = '/seller-profile';
  static const String sendTip      = '/send-tip';
  static const String productDetails = '/product-details';
  static const String liveVideo    = '/live-video';
  static const String addPaymentMethod = '/add-payment-method';
  static const String paymentCards = '/payment-cards';
  static const String addNewCard = '/add-new-card';
  static const String categoryProduct = '/category-product';
  static const String search = '/search';
  static const String orderSummary = '/order-summary';
  static const String streamHub = '/stream-hub';
  static const String createListing = '/create-listing';
  static const String categorySelection = '/category-selection';
  static const String subCategorySelection = '/sub-category-selection';
  static const String sellerDescription = '/seller-description';
  static const String sellerGuide = '/seller-guide';
  static const String createProductListing = '/create-product-listing';
  static const String salesFormat = '/sales-format';
  static const String previewListing = '/preview-listing';
  static const String liveStream = '/live-stream';
  static const String finance = '/finance';
  static const String orders = '/orders';
  static const String salesAnalytics = '/sales-analytics';
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
        StreamHubBinding(),
      ],
    ),
    GetPage(
      name: AppRouteKeys.sellerProfile,
      page: () => const SellerProfileScreen(),
      binding: SellerProfileBinding(),
    ),
    GetPage(name: AppRouteKeys.sendTip, page: () => const SendTipScreen()),
    GetPage(name: AppRouteKeys.productDetails, page: () => ProductDetailsScreen(product: Get.arguments)),
    GetPage(name: AppRouteKeys.liveVideo, page: () => const LiveVideoScreen()),
    GetPage(name: AppRouteKeys.addPaymentMethod, page: () => const AddPaymentMethodScreen()),
    GetPage(name: AppRouteKeys.paymentCards, page: () => const PaymentCardsScreen()),
    GetPage(name: AppRouteKeys.addNewCard, page: () => const AddNewCardScreen()),
    GetPage(name: AppRouteKeys.categoryProduct, page: () => const CategoryProductScreen()),
    GetPage(name: AppRouteKeys.search, page: () => const SearchScreen()),
    GetPage(name: AppRouteKeys.orderSummary, page: () => OrderSummaryScreen(item: Get.arguments)),
    GetPage(
      name: AppRouteKeys.streamHub,
      page: () => const StreamHubView(),
      binding: StreamHubBinding(),
    ),
    GetPage(
      name: AppRouteKeys.createListing,
      page: () => const CreateListingScreen(),
      binding: CreateListingBinding(),
    ),
    GetPage(
      name: AppRouteKeys.categorySelection,
      page: () => const CategorySelectionScreen(),
      binding: CategorySelectionBinding(),
    ),
    GetPage(
      name: AppRouteKeys.subCategorySelection,
      page: () => const SubCategorySelectionScreen(),
      binding: SubCategorySelectionBinding(),
    ),
    GetPage(
      name: AppRouteKeys.sellerDescription,
      page: () => const SellerDescriptionScreen(),
      binding: SellerDescriptionBinding(),
    ),
    GetPage(
      name: AppRouteKeys.sellerGuide,
      page: () => const SellerGuideScreen(),
      binding: SellerGuideBinding(),
    ),
    GetPage(
      name: AppRouteKeys.createProductListing,
      page: () => const CreateProductListingScreen(),
      binding: CreateProductListingBinding(),
    ),
    GetPage(
      name: AppRouteKeys.salesFormat,
      page: () => const SalesFormatScreen(),
      binding: SalesFormatBinding(),
    ),
    GetPage(
      name: AppRouteKeys.previewListing,
      page: () => const PreviewListingScreen(),
      binding: PreviewListingBinding(),
    ),
    GetPage(
      name: AppRouteKeys.liveStream,
      page: () => const LiveStreamView(),
      binding: LiveStreamBinding(),
    ),
    GetPage(
      name: AppRouteKeys.editProfile,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRouteKeys.inventory,
      page: () => const InventoryScreen(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: AppRouteKeys.finance,
      page: () => const FinanceView(),
      binding: FinanceBinding(),
    ),
    GetPage(
      name: AppRouteKeys.orders,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: AppRouteKeys.salesAnalytics,
      page: () => const SalesAnalyticsView(),
      binding: SalesAnalyticsBinding(),
    ),
  ];
}
