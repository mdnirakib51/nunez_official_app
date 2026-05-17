import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/global_widget/global_bottom_widget.dart';
import '../../global/global_widget/global_image_loader.dart';
import '../../global/global_widget/global_sized_box.dart';
import '../../global/global_widget/global_text.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  final VoidCallback onTap;

  const NoInternetConnectionScreen({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // No Internet Icon
              GlobalImageLoader(
                imagePath: Assets.appIcons.noInternetConnectionIc.path,
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              sizedBoxH(30),
              // Title
              const GlobalText(
                str: "No Internet Connection",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              sizedBoxH(12),
              // Subtitle
              const GlobalText(
                str: "Please check your internet connection and\ntry again",
                color: ColorRes.grey,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Retry Button
              GlobalButtonWidget(
                str: "Retry",
                onTap: onTap,
                buttomColor: ColorRes.appButtonColor,
                textColor: ColorRes.white,
                radius: 30,
                height: 55,
              ),
              sizedBoxH(20),
            ],
          ),
        ),
      ),
    );
  }
}
