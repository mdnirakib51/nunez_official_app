import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/global_widget/global_bottom_widget.dart';
import '../../global/global_widget/global_image_loader.dart';
import '../../global/global_widget/global_sized_box.dart';
import '../../global/global_widget/global_text.dart';

class CongratulationsScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CongratulationsScreen({
    super.key,
    required this.title,
    required this.subTitle,
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
              const Spacer(flex: 1),
              // Success Icon from Assets
              GlobalImageLoader(
                imagePath: Assets.appIcons.congratulationIc.path,
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              // Dynamic Title
              GlobalText(
                str: title,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              sizedBoxH(8),
              // Dynamic Subtitle
              GlobalText(
                str: subTitle,
                color: ColorRes.grey900,
                textAlign: TextAlign.center,
              ),

              sizedBoxH(20),
              // Dynamic Button
              GlobalButtonWidget(
                str: "Continue",
                onTap: onTap,
                buttomColor: ColorRes.appButtonColor,
                textColor: ColorRes.white,
                radius: 30,
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
