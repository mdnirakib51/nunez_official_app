import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../app/routes/app_route.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            str: AppStrings.profile,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Profile Header
          _buildProfileHeader(),
          
          // TabBar
          TabBar(
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
              Tab(text: AppStrings.sellerHub),
              Tab(text: AppStrings.account),
            ],
          ),
          
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSellerHubTab(),
                _buildAccountTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual user image
          ),
          sizedBoxW(15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: "Tanvir Chowdhury",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                GlobalText(
                  str: "tanvirchowdhury123@gmail.com",
                  fontSize: 13,
                  color: ColorRes.grey,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.editProfile),
            child: GlobalImageLoader(
              imagePath: Assets.appIcons.profileIc.editProfileIc.path,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerHubTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Grid items (Inventory, Shows, Payouts, Orders)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.9,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.inventory),
                child: _buildGridItem(AppStrings.inventory, Assets.appIcons.profileIc.inventoryIc.path),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.streamHub, arguments: true),
                child: _buildGridItem(AppStrings.shows, Assets.appIcons.profileIc.showsIc.path),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.finance),
                child: _buildGridItem(AppStrings.payouts, Assets.appIcons.profileIc.payoutsIc.path),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteKeys.orders),
                child: _buildGridItem(AppStrings.orders, Assets.appIcons.profileIc.orderIc.path),
              ),
            ],
          ),
          sizedBoxH(25),
          
          // List items
          _buildListItem(AppStrings.tips, Assets.appIcons.profileIc.tipsIc.path),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.salesAnalytics),
            child: _buildListItem(AppStrings.salesAnalytics, Assets.appIcons.profileIc.salesAnalyticsIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.followers),
            child: _buildListItem(AppStrings.followers, Assets.appIcons.profileIc.followersIc.path),
          ),
          _buildListItem(AppStrings.report, Assets.appIcons.profileIc.reportIc.path),
          
          // Vacation Mode
          _buildVacationModeTile(),

          sizedBoxH(40),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, String iconPath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlobalImageLoader(
            imagePath: iconPath,
            height: 22,
            width: 22,
          ),
          GlobalText(
            str: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, String iconPath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: GlobalImageLoader(
              imagePath: iconPath,
              height: 22,
              width: 22,
            ),
          ),
          sizedBoxW(15),
          Expanded(
            child: GlobalText(
              str: title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildVacationModeTile() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: GlobalImageLoader(
            imagePath: Assets.appIcons.profileIc.vacationModeIc.path,
            height: 24,
            width: 24,
          ),
        ),
        sizedBoxW(15),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: AppStrings.vacationMode,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              GlobalText(
                str: AppStrings.vacationModeSubTitle,
                fontSize: 12,
                color: ColorRes.grey,
              ),
            ],
          ),
        ),
        Obx(() => Switch(
          value: controller.vacationMode.value,
          onChanged: (value) => controller.vacationMode.value = value,
          activeColor: ColorRes.appColor,
        )),
      ],
    );
  }

  Widget _buildAccountTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.paymentAndShipping),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.paymentsAndShipping, Assets.appIcons.profileIc.shippingAddressIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.notification),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.notifications, Assets.appIcons.notificationIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.changePassword),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.changePassword, Assets.appIcons.profileIc.changePasswordIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.following),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.following, Assets.appIcons.profileIc.followersIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.language),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.language, Assets.appIcons.profileIc.languageIc.path),
          ),

          sizedBoxH(10),
          const GlobalText(
            str: AppStrings.helpAndLegal,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          sizedBoxH(20),

          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.helpSupport),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.helpSupport, Assets.appIcons.profileIc.helpSupportIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.termsConditions),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.termsConditions, Assets.appIcons.profileIc.termsConditionIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.privacyPolicy),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.privacyPolicy, Assets.appIcons.profileIc.reportIc.path),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRouteKeys.faq),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.faq, Assets.appIcons.profileIc.faqIc.path),
          ),
          GestureDetector(
            onTap: () => _showDeleteAccountDialog(),
            behavior: HitTestBehavior.opaque,
            child: _buildListItem(AppStrings.deleteAccount, Assets.appIcons.profileIc.deleteAccountIc.path),
          ),

          sizedBoxH(20),
          _buildLogoutButton(),
          sizedBoxH(40),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () => _showLogoutDialog(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalImageLoader(
              imagePath: Assets.appIcons.profileIc.logoutIc.path,
              height: 20,
              width: 20,
              color: Colors.red,
            ),
            sizedBoxW(10),
            const GlobalText(
              str: AppStrings.logout,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: ColorRes.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20, left: 20, right: 20),
              child: Column(
                children: [
                  const GlobalText(
                    str: "Logout",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  sizedBoxH(15),
                  const GlobalText(
                    str: "Are you sure you want to logout?",
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.back(),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Cancel",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        Get.offAllNamed(AppRouteKeys.login);
                      },
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Yes, Logout",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: ColorRes.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20, left: 20, right: 20),
              child: Column(
                children: [
                  const GlobalText(
                    str: "Account Delete",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  sizedBoxH(15),
                  const GlobalText(
                    str: "Are you sure you want to delete your account?",
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.back(),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Cancel",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRouteKeys.deleteAccount);
                      },
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const GlobalText(
                          str: "Yes, Delete",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
