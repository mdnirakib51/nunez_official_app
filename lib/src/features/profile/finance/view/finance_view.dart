import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/finance_controller.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({super.key});

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FinanceController controller = Get.find<FinanceController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: GlobalAppBar(
        title: "Finance",
        isBackIc: true,
      ),
      body: Column(
        children: [
          // TabBar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.grey.shade200,
              dividerHeight: 1,
              labelColor: ColorRes.black,
              unselectedLabelColor: ColorRes.grey,
              labelPadding: const EdgeInsets.only(left: 0, right: 30),
              padding: const EdgeInsets.only(left: 16),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              indicatorColor: ColorRes.black,
              indicatorSize: TabBarIndicatorSize.label,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(text: "Payouts"),
                Tab(text: "Transactions"),
              ],
            ),
          ),
          
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPayoutsTab(),
                _buildTransactionsTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _tabController.index == 0 ? _buildWithdrawButton() : null,
    );
  }

  Widget _buildPayoutsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalText(
            str: "Available Balance",
            fontSize: 14,
            color: ColorRes.grey,
            fontWeight: FontWeight.w500,
          ),
          sizedBoxH(5),
          Obx(() => GlobalText(
            str: "\$${controller.availableBalance.value.toStringAsFixed(2)}",
            fontSize: 32,
            fontWeight: FontWeight.bold,
          )),
          sizedBoxH(30),
          
          // Balance Summary Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              children: [
                _buildSummaryRow(Icons.monetization_on_outlined, "\$200.00 Available for withdrawal"),
                const Divider(height: 30),
                _buildSummaryRow(Icons.lock_outline, "\$140.00 will be available soon"),
                const Divider(height: 30),
                _buildSummaryRow(Icons.info_outline, "Not eligible for early payout", showArrow: true),
              ],
            ),
          ),
          
          sizedBoxH(40),
          const GlobalText(
            str: "History",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          sizedBoxH(15),
          
          // History List
          Obx(() => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.payoutHistory.length,
            separatorBuilder: (context, index) => sizedBoxH(15),
            itemBuilder: (context, index) {
              final item = controller.payoutHistory[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          str: item['type'],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        sizedBoxH(4),
                        GlobalText(
                          str: item['date'],
                          fontSize: 12,
                          color: ColorRes.grey,
                        ),
                      ],
                    ),
                    GlobalText(
                      str: "\$${item['amount'].toStringAsFixed(2)}",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.appButtonColor,
                    ),
                  ],
                ),
              );
            },
          )),
          sizedBoxH(20),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String text, {bool showArrow = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: ColorRes.black),
        sizedBoxW(12),
        Expanded(
          child: GlobalText(
            str: text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (showArrow) const Icon(Icons.arrow_forward_ios, size: 14, color: ColorRes.grey),
      ],
    );
  }

  Widget _buildTransactionsTab() {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Icon(Icons.search, color: ColorRes.grey, size: 22),
                sizedBoxW(10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: ColorRes.grey, fontSize: 14),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Transaction List
        Expanded(
          child: Obx(() => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: controller.transactions.length,
            separatorBuilder: (context, index) => sizedBoxH(15),
            itemBuilder: (context, index) {
              final item = controller.transactions[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(item['img']),
                    ),
                    sizedBoxW(15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalText(
                            str: item['name'],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          sizedBoxH(4),
                          if (item['type'] == 'order')
                            Row(
                              children: [
                                GlobalText(
                                  str: "Order id: ",
                                  fontSize: 12,
                                  color: ColorRes.grey,
                                ),
                                GlobalText(
                                  str: item['orderId'],
                                  fontSize: 12,
                                  color: ColorRes.green,
                                ),
                                sizedBoxW(5),
                                const Icon(Icons.copy, size: 12, color: ColorRes.green),
                              ],
                            )
                          else
                            const GlobalText(
                              str: "Tips",
                              fontSize: 12,
                              color: ColorRes.green,
                            ),
                        ],
                      ),
                    ),
                    GlobalText(
                      str: "\$${item['amount'].toStringAsFixed(2)}",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.appButtonColor,
                    ),
                  ],
                ),
              );
            },
          )),
        ),
      ],
    );
  }

  Widget _buildWithdrawButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorRes.appButtonColor,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const GlobalText(
          str: "Withdraw",
          color: ColorRes.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
