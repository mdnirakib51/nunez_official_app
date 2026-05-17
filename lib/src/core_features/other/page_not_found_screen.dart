import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/global_widget/global_bottom_widget.dart';
import '../../global/global_widget/global_image_loader.dart';
import '../../global/global_widget/global_sized_box.dart';
import '../../global/global_widget/global_text.dart';

class PageNotFoundScreen extends StatelessWidget {
  final VoidCallback onTap;

  const PageNotFoundScreen({
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
              // 404 Icon
              GlobalImageLoader(
                imagePath: Assets.appIcons.pageNotFoundIc.path,
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              sizedBoxH(30),
              // Title
              const GlobalText(
                str: "Sorry, Page not Found",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              sizedBoxH(12),
              // Subtitle
              const GlobalText(
                str: "The page you requested could not be found",
                color: ColorRes.grey,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Go Back Button
              GlobalButtonWidget(
                str: "Go Back",
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
