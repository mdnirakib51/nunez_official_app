import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        ),
        title: const GlobalText(
          str: "Cart",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _cartItem(
                  title: "ZaRa Original Hand bag",
                  desc: "Brand New",
                  price: "\$10.00",
                  img: "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
                ),
                sizedBoxH(15),
                _cartItem(
                  title: "Olive Smart Watch",
                  desc: "Brand New",
                  price: "\$20.00",
                  img: "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
                ),
                sizedBoxH(30),
                const GlobalText(
                  str: "Payment Summary",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                sizedBoxH(15),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _summaryRow("Nike Running Shoes  X 1", "\$240.00"),
                      sizedBoxH(12),
                      _summaryRow("Delivery Charge", "\$20.00"),
                      sizedBoxH(12),
                      _summaryRow("Other Charge", "\$10.00"),
                      sizedBoxH(12),
                      _summaryRow("Tax", "\$10.00"),
                      sizedBoxH(15),
                      const Divider(),
                      sizedBoxH(15),
                      _summaryRow("Total", "\$280.00", isTotal: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const GlobalText(
                  str: "Pay Now",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          sizedBoxH(10),
        ],
      ),
    );
  }

  Widget _cartItem({required String title, required String desc, required String price, required String img}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(img, height: 80, width: 80, fit: BoxFit.cover),
          ),
          sizedBoxW(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GlobalText(str: title, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Icon(Icons.delete_outline, color: Colors.grey, size: 22),
                  ],
                ),
                GlobalText(str: desc, fontSize: 12, color: Colors.grey),
                sizedBoxH(5),
                GlobalText(str: price, fontWeight: FontWeight.bold, fontSize: 14),
                sizedBoxH(10),
                Row(
                  children: [
                    _quantityBtn(Icons.remove),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GlobalText(str: "1", fontWeight: FontWeight.bold),
                    ),
                    _quantityBtn(Icons.add, isBlack: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityBtn(IconData icon, {bool isBlack = false}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isBlack ? Colors.black : Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: isBlack ? Colors.white : Colors.black, size: 16),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlobalText(
          str: label,
          fontSize: isTotal ? 16 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
          color: isTotal ? Colors.black : Colors.grey.shade700,
        ),
        GlobalText(
          str: value,
          fontSize: isTotal ? 16 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
        ),
      ],
    );
  }
}
