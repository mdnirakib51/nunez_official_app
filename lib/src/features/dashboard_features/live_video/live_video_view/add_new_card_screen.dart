import 'package:flutter/material.dart';
import '../../../../global/components/global_appbar.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: AppStrings.addPaymentMethod,
        titleColor: ColorRes.black,
        iconColor: ColorRes.black,
        backColor: ColorRes.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Preview
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1E3A5F),
                    Color(0xFF2D5A8E),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GlobalText(
                        str: "world",
                        color: ColorRes.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      const Icon(Icons.wifi, color: ColorRes.white, size: 24),
                    ],
                  ),
                  const Spacer(),
                  const Center(
                    child: GlobalText(
                      str: "5412 7512 3412 3456",
                      color: ColorRes.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const GlobalText(
                            str: "12/23",
                            color: ColorRes.white,
                            fontSize: 10,
                          ),
                          const GlobalText(
                            str: "Lee M. Cardholder",
                            color: ColorRes.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const GlobalText(
                            str: "debit",
                            color: ColorRes.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          sizedBoxH(5),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEB001B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-10, 0),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF79E1B),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sizedBoxH(30),
            GlobalTextFormField(
              controller: nameController,
              titleText: AppStrings.name,
              hintText: AppStrings.enterName,
              titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            sizedBoxH(20),
            GlobalTextFormField(
              controller: cardNumberController,
              titleText: AppStrings.cardNumber,
              hintText: "**** **** **** ****",
              keyboardType: TextInputType.number,
              titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            sizedBoxH(20),
            Row(
              children: [
                Expanded(
                  child: GlobalTextFormField(
                    controller: expiryDateController,
                    titleText: AppStrings.expiryDate,
                    hintText: "12/30",
                    keyboardType: TextInputType.datetime,
                    titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                sizedBoxW(20),
                Expanded(
                  child: GlobalTextFormField(
                    controller: cvcController,
                    titleText: AppStrings.cvc,
                    hintText: "1234",
                    keyboardType: TextInputType.number,
                    titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            sizedBoxH(40),
            GlobalButtonWidget(
              str: AppStrings.saveCard,
              radius: 30,
              height: 55,
              onTap: () {
                // Handle save card
              },
            ),
          ],
        ),
      ),
    );
  }
}
