import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_text.dart';
import 'purchase/view/purchase_tab.dart';
import 'bids/view/bids_tab.dart';
import 'message/view/message_tab.dart';
import 'saved/view/saved_tab.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: GlobalText(
            str: "Activity",
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.grey.shade200,
          dividerHeight: 1,
          labelColor: ColorRes.black,
          unselectedLabelColor: ColorRes.grey,
          labelPadding: const EdgeInsets.only(left: 0, right: 20),
          padding: const EdgeInsets.only(left: 16),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          indicatorColor: ColorRes.black,
          indicatorSize: TabBarIndicatorSize.label,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          enableFeedback: false,
          tabs: const [
            Tab(text: "Purchases"),
            Tab(text: "Bids"),
            Tab(text: "Message"),
            Tab(text: "Saved"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PurchaseTab(),
          BidsTab(),
          MessageTab(),
          SavedTab(),
        ],
      ),
    );
  }
}
