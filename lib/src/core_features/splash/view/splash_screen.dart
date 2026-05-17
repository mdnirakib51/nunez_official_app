
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/global_widget/global_image_loader.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A12),
      body: Scaffold(
        backgroundColor: ColorRes.appBackColor,
        body: Center(
          child: GlobalImageLoader(
            imagePath: Assets.appIcons.appLogoIc.path,
            height: 150,
          ),
        ),
      ),
    );
  }
}
