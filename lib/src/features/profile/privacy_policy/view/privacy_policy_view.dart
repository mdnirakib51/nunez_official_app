import 'package:flutter/material.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Privacy Policy",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalText(
              str: "Privacy Policy",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(15),
            const GlobalText(
              str: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              fontSize: 14,
              color: ColorRes.black,
            ),
            sizedBoxH(20),
            const GlobalText(
              str: "Data Collection",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            sizedBoxH(10),
            const GlobalText(
              str: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
