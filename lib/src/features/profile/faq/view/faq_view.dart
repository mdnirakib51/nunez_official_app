import 'package:flutter/material.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      "What is this platform?",
      "How do I create an account?",
      "Is it free to use the platform?",
      "How do I book a property?",
      "Can I cancel my booking?",
      "Are properties verified?",
    ];

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "FAQ",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                sizedBoxH(20),
                const GlobalText(
                  str: "We are here to help you with anything and\neverything in pur service",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                sizedBoxH(20),
                ...faqs.map((faq) => Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
                  ),
                  child: ExpansionTile(
                    title: GlobalText(
                      str: faq,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    trailing: const Icon(Icons.add, color: ColorRes.grey),
                    tilePadding: EdgeInsets.zero,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: GlobalText(
                          str: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          fontSize: 13,
                          color: ColorRes.grey900,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GlobalText(str: "Still Stuck? ", fontSize: 14),
                GestureDetector(
                  onTap: () {},
                  child: const GlobalText(
                    str: "Help Center",
                    fontSize: 14,
                    color: ColorRes.appButtonColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
