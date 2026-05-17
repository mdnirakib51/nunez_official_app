import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../app/routes/app_route.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_bottom_widget.dart';
import '../../../global/global_widget/global_image_loader.dart';
import '../../../global/global_widget/global_sized_box.dart';
import '../../../global/global_widget/global_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: GlobalImageLoader(
              imagePath: Assets.appImages.onBoardBackImg.path,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size(context).width * 0.06),
              child: Column(
                children: [
                  // Language selector (Static English)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const GlobalText(
                            str: AppStrings.english,
                            color: ColorRes.white,
                            fontSize: 12,
                          ),
                          sizedBoxW(4),
                          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),

                  // App Logo
                  GlobalImageLoader(
                    imagePath: Assets.appIcons.appLogoIc.path,
                    height: size(context).height * 0.15,
                    width: size(context).height * 0.15,
                  ),

                  const Spacer(flex: 1),

                  // Titles
                  const GlobalText(
                    str: AppStrings.onBoardTitle,
                    textAlign: TextAlign.center,
                    color: ColorRes.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  sizedBoxH(12),
                  const GlobalText(
                    str: AppStrings.onBoardSubTitle,
                    textAlign: TextAlign.center,
                    color: ColorRes.white,
                    fontSize: 14,
                  ),

                  const Spacer(flex: 2),

                  // Sign Up with Email
                  GlobalButtonWidget(
                    str: AppStrings.signUpWithEmail,
                    img: Assets.appIcons.onboardEmail.path,
                    onTap: () => Get.toNamed(AppRouteKeys.registration),
                    buttomColor: ColorRes.appButtonColor,
                    textColor: ColorRes.white,
                    imgColor: ColorRes.white,
                    radius: 30,
                    height: 50,
                  ),

                  sizedBoxH(16),

                  // Sign Up with Google
                  GlobalButtonWidget(
                    str: AppStrings.signUpWithGoogle,
                    img: Assets.socialIc.googleIc.path,
                    onTap: () {},
                    buttomColor: ColorRes.white,
                    textColor: ColorRes.black,
                    imgColor: null,
                    radius: 30,
                    height: 50,
                  ),

                  sizedBoxH(24),

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const GlobalText(
                        str: AppStrings.alreadyHaveAccount,
                        color: ColorRes.white,
                        fontSize: 14,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRouteKeys.login),
                        child: const GlobalText(
                          str: AppStrings.login,
                          color: ColorRes.appButtonColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Footer text
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontFamily: 'Inter',
                        ),
                        children: [
                          const TextSpan(text: AppStrings.agreeTermsPrefix),
                          TextSpan(
                            text: AppStrings.termsOfService,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              decoration: TextDecoration.underline,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const TextSpan(text: AppStrings.and),
                          TextSpan(
                            text: AppStrings.privacyPolicy,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              decoration: TextDecoration.underline,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
