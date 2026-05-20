import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/global_widget/global_image_loader.dart';
import '../../../../../global/global_widget/global_sized_box.dart';
import '../../../../../global/global_widget/global_text.dart';
import 'auction_setting_bottom_sheet.dart';

class LiveListingBottomSheet extends StatelessWidget {
  const LiveListingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          sizedBoxH(10),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: ColorRes.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          sizedBoxH(15),
          const GlobalText(
            str: "Live Listing",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          sizedBoxH(15),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: ColorRes.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.search, color: ColorRes.grey),
                  sizedBoxW(10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search shop...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: ColorRes.grey, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizedBoxH(15),
          // Tabs
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: ColorRes.black,
                    labelColor: ColorRes.black,
                    unselectedLabelColor: ColorRes.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Auction"),
                      Tab(text: "Buy Now"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildAuctionList(context),
                        const Center(child: GlobalText(str: "Buy Now Items")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuctionList(BuildContext context) {
    final products = [
      {
        "name": "ZaRa Original Hand bag",
        "qty": 40,
        "price": "10.00",
        "bids": 4,
        "highest": null,
        "image": Assets.dummyImg.homeDummyImg1.path
      },
      {
        "name": "Adidas Running Shoes",
        "qty": 40,
        "price": "10.00",
        "bids": 4,
        "highest": "25.00",
        "image": Assets.dummyImg.homeDummyImg2.path
      },
      {
        "name": "PWC Casual Watch",
        "qty": 40,
        "price": "10.00",
        "bids": 4,
        "highest": "25.00",
        "image": Assets.dummyImg.homeDummyImg2.path
      },
    ];

    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GlobalImageLoader(
                  imagePath: product['image'] as String,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              sizedBoxW(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      str: product['name'] as String,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    GlobalText(
                      str: "Qty: ${product['qty']}  •  Brand New",
                      fontSize: 12,
                      color: ColorRes.grey,
                    ),
                    Row(
                      children: [
                        GlobalText(
                          str: "\$${product['price']}",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GlobalText(
                          str: "${product['bids']} bids",
                          fontSize: 12,
                          color: ColorRes.grey,
                        ),
                        if (product['highest'] != null) ...[
                          sizedBoxW(10),
                          GlobalText(
                            str: "Highest bid \$${product['highest']}",
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ]
                      ],
                    ),
                    sizedBoxH(10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => const AuctionSettingBottomSheet(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorRes.grey.withValues(alpha: 0.1),
                              foregroundColor: ColorRes.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const GlobalText(
                              str: "Start Auction",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        sizedBoxW(10),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorRes.black,
                            shape: BoxShape.circle,
                          ),
                          child: GlobalImageLoader(
                            imagePath: Assets.appIcons.liveVideoIc.pinIc.path,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
