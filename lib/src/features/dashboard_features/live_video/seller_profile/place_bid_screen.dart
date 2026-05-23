import 'package:flutter/material.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class PlaceBidScreen extends StatelessWidget {
  final Map<String, String> product;
  const PlaceBidScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: product["title"] ?? "Product Details",
        backColor: ColorRes.white,
        iconColor: ColorRes.black,
        titleColor: ColorRes.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sizedBoxH(30),
            const GlobalText(
              str: "Place your Bid",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
                children: [
                  const TextSpan(text: "You're setting a maximum bid for the "),
                  TextSpan(
                    text: product["title"] ?? "Product",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const TextSpan(text: ". We'll automatically bid on your behalf during the auction, up to your selected limit."),
                ],
              ),
            ),
            sizedBoxH(40),
            const GlobalText(
              str: "You're currently winning at \$6.00",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlobalText(
                  str: "Max Bid",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                sizedBoxH(5),
                const GlobalText(
                  str: "Enter a bid above your existing max bid of \$6.00",
                  color: ColorRes.grey900,
                  fontSize: 13,
                ),
                sizedBoxH(10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixText: "\$ ",
                      prefixStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      hintText: "7",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            sizedBoxH(30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.orange.shade900,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: const GlobalText(
                str: "Submit",
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            sizedBoxH(15),
            const GlobalText(
              str: "Your max bid cannot be canceled or reduced after submission, but you're free to raise it whenever needed.",
              color: ColorRes.grey900,
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
            sizedBoxH(30),
          ],
        ),
      ),
    );
  }
}
