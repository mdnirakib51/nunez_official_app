import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../app/routes/app_route.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_image_loader.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../seller_profile/product_details_screen.dart';

class LiveVideoScreen extends StatefulWidget {
  const LiveVideoScreen({super.key});

  @override
  State<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends State<LiveVideoScreen> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  bool _isPausedForNavigation = false;

  // Bidding State
  int _currentBid = 7;
  int _timerSeconds = 15;
  Timer? _bidTimer;
  bool _isBiddingActive = true;
  double _swipePosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"),
      httpHeaders: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
    )..initialize().then((_) {
        if (mounted && !_isPausedForNavigation) {
          setState(() {});
          _controller.play();
          _controller.setLooping(true);
        }
      }).catchError((error) {
        debugPrint("Video Player Error: $error");
      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _bidTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _bidTimer?.cancel();
    _bidTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        setState(() {
          _isBiddingActive = false;
        });
        _bidTimer?.cancel();
      }
    });
  }

  void _resetTimerAndBid(int amount) {
    setState(() {
      _currentBid = amount;
      _timerSeconds = 15;
      _isBiddingActive = true;
      _swipePosition = 0.0;
    });
    _startTimer();
  }

  void _showCustomBidDialog() {
    final TextEditingController amountController = TextEditingController();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GlobalText(
                    str: "Custom Your Bid",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),
              sizedBoxH(20),
              const GlobalText(
                str: "Amount",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              const GlobalText(
                str: "Your bid must be higher than the current highest bid.",
                fontSize: 12,
                color: Colors.grey,
              ),
              sizedBoxH(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              sizedBoxH(20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorRes.indigo.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: ColorRes.indigo, size: 20),
                    sizedBoxW(10),
                    const Expanded(
                      child: GlobalText(
                        str: "If you win, your payment method will be charged automatically.",
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxH(25),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const GlobalText(str: "Cancel", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  sizedBoxW(15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (amountController.text.isNotEmpty) {
                          int? newBid = int.tryParse(amountController.text);
                          if (newBid != null && newBid > _currentBid) {
                            Get.back();
                            _resetTimerAndBid(newBid);
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade900,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const GlobalText(str: "Place Bid", color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _controller.pause();
    } else if (state == AppLifecycleState.resumed) {
      if (!_isPausedForNavigation && mounted && _controller.value.isInitialized) {
        _controller.play();
      }
    }
  }

  void _navigateToSellerProfile(BuildContext context) async {
    _isPausedForNavigation = true;
    _controller.pause();
    await Get.toNamed(AppRouteKeys.sellerProfile);
    _isPausedForNavigation = false;
    if (mounted) {
      _controller.play();
    }
  }

  void _navigateToProductDetails() async {
    _isPausedForNavigation = true;
    _controller.pause();
    await Get.to(() => ProductDetailsScreen(product: const {
          "title": "ZaRa Original Hand bag",
          "img": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
          "desc": "40 Available  •  Brand New"
        }));
    _isPausedForNavigation = false;
    if (mounted) {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: Stack(
        children: [
          // Background Video
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator(color: ColorRes.white)),

          // Dark Overlay Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorRes.black.withValues(alpha: 0.4),
                  Colors.transparent,
                  ColorRes.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      // User Info & Follow Button
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => _navigateToSellerProfile(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    radius: 18,
                                    backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=annie"),
                                  ),
                                  sizedBoxW(8),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const GlobalText(
                                          str: "Annie Marie",
                                          color: ColorRes.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.star, color: ColorRes.white, size: 12),
                                            GlobalText(
                                              str: " 4.9",
                                              color: ColorRes.white,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxW(12),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade800,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const GlobalText(
                                  str: "Follow",
                                  color: ColorRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            sizedBoxW(4),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Viewers Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorRes.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.sensors, color: Colors.red, size: 16),
                            sizedBoxW(6),
                            const GlobalText(
                              str: "1K",
                              color: ColorRes.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      sizedBoxW(10),
                      // Close Button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorRes.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.keyboard_arrow_down, color: ColorRes.white, size: 28),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom Content (Comments & Product + Right Icons)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Comments & Product Card
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Comments Area
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: 4,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final names = ["Nazmul Islam Sakib", "Farhan Tanvir Chowdhury", "Rafsan Jamil", "Rafa Jamila"];
                                  final avatars = [
                                    "https://i.pravatar.cc/150?u=sakib",
                                    "https://i.pravatar.cc/150?u=farhan",
                                    "https://i.pravatar.cc/150?u=rafsan",
                                    "https://i.pravatar.cc/150?u=rafa"
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(avatars[index]),
                                        ),
                                        sizedBoxW(10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GlobalText(
                                                str: names[index],
                                                color: ColorRes.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const GlobalText(
                                                str: "So Nice, Looking So pretty dress",
                                                color: ColorRes.white,
                                                fontSize: 11,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            sizedBoxH(15),
                            // Product Card
                            GestureDetector(
                              onTap: _navigateToProductDetails,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: ColorRes.black.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: GlobalImageLoader(
                                        imagePath: Assets.dummyImg.homeDummyImg2.path,
                                        height: 65,
                                        width: 65,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    sizedBoxW(12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const GlobalText(
                                            str: "ZaRa Original Hand bag",
                                            color: ColorRes.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const GlobalText(
                                            str: "Brand New",
                                            color: ColorRes.white,
                                            fontSize: 12,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          sizedBoxH(6),
                                          Row(
                                            children: [
                                              _badge("Free Shipping", ColorRes.indigo.withValues(alpha: 0.7)),
                                              sizedBoxW(6),
                                              _badge("+ Taxes", ColorRes.grey.withValues(alpha: 0.7)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const GlobalText(
                                          str: "\$10.00",
                                          color: ColorRes.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        GlobalText(
                                          str: "Sold",
                                          color: Colors.orange.shade700,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxW(15),
                      // Right Side Icons
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _sideIcon(Assets.appIcons.liveVideoIc.moreVert.path, "More"),
                          _sideIcon(Assets.appIcons.liveVideoIc.tipIc.path, "Tip"),
                          _sideIcon(Assets.appIcons.liveVideoIc.walletIc.path, "Wallet"),
                          _sideIcon(Assets.appIcons.liveVideoIc.shareIc.path, "Share", count: "5"),
                          GestureDetector(
                            onTap: () => _navigateToSellerProfile(context),
                            child: _sideIcon(Assets.appIcons.liveVideoIc.viewShopIc.path, "View\nShop", isCircle: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                sizedBoxH(20),

                // Bottom Input and Bidding Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      // "Say Something" Input
                      Container(
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.white.withValues(alpha: 0.6), width: 1.0),
                          borderRadius: BorderRadius.circular(30),
                          color: ColorRes.black.withValues(alpha: 0.2),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const GlobalText(
                          str: "Say Something",
                          color: ColorRes.white,
                          fontSize: 15,
                        ),
                      ),
                      sizedBoxH(15),
                      // Bidding UI or Awaiting Next Item
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: _isBiddingActive
                            ? Row(
                                key: const ValueKey("bidding_active"),
                                children: [
                                  // Custom Button
                                  Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onTap: _showCustomBidDialog,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: ColorRes.white, width: 0.5),
                                          borderRadius: BorderRadius.circular(30),
                                          color: ColorRes.white.withValues(alpha: 0.1),
                                        ),
                                        alignment: Alignment.center,
                                        child: const GlobalText(
                                          str: "Custom",
                                          color: ColorRes.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizedBoxW(12),
                                  // Combined Bid Button and Timer (Pill-in-Pill with Swipe)
                                  Expanded(
                                    flex: 7,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        double totalWidth = constraints.maxWidth;
                                        double timerWidth = 85;
                                        double padding = 4;
                                        double bidButtonWidth = totalWidth - timerWidth - (padding * 2);
                                        double maxSwipe = totalWidth - bidButtonWidth - (padding * 2);

                                        return Container(
                                          height: 52,
                                          padding: EdgeInsets.all(padding),
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade700.withValues(alpha: 0.3),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Stack(
                                            children: [
                                              // Timer part (Visible in background when swiping)
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: SizedBox(
                                                  width: timerWidth,
                                                  child: Center(
                                                    child: GlobalText(
                                                      str: "$_timerSeconds Sec",
                                                      color: ColorRes.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Draggable Bid Button
                                              AnimatedPositioned(
                                                duration: _swipePosition == 0 ? const Duration(milliseconds: 200) : Duration.zero,
                                                left: _swipePosition,
                                                top: 0,
                                                bottom: 0,
                                                width: bidButtonWidth,
                                                child: GestureDetector(
                                                  onHorizontalDragUpdate: (details) {
                                                    setState(() {
                                                      _swipePosition += details.delta.dx;
                                                      if (_swipePosition < 0) _swipePosition = 0;
                                                      if (_swipePosition > maxSwipe) _swipePosition = maxSwipe;
                                                    });
                                                  },
                                                  onHorizontalDragEnd: (details) {
                                                    if (_swipePosition >= maxSwipe * 0.8) {
                                                      _resetTimerAndBid(_currentBid + 2);
                                                    } else {
                                                      setState(() {
                                                        _swipePosition = 0.0;
                                                      });
                                                    }
                                                  },
                                                  onTap: () {
                                                    // Optional: Tap still works, but swipe is emphasized
                                                    _resetTimerAndBid(_currentBid + 2);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange.shade900,
                                                      borderRadius: BorderRadius.circular(30),
                                                      boxShadow: [
                                                        if (_swipePosition > 0)
                                                          BoxShadow(
                                                            color: Colors.black.withValues(alpha: 0.2),
                                                            blurRadius: 4,
                                                            offset: const Offset(2, 0),
                                                          ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        const Spacer(flex: 2),
                                                        GlobalText(
                                                          str: "Bid: \$$_currentBid",
                                                          color: ColorRes.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        const Spacer(flex: 1),
                                                        // More prominent arrow to suggest swiping
                                                        const Icon(
                                                          Icons.keyboard_double_arrow_right_rounded,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                        sizedBoxW(10),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                key: const ValueKey("bidding_inactive"),
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.watch_later_outlined, color: ColorRes.white, size: 20),
                                    sizedBoxW(10),
                                    const GlobalText(
                                      str: "Awaiting Next Item...",
                                      color: ColorRes.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      sizedBoxH(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideIcon(String iconPath, String label, {String? count, bool isCircle = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                child: GlobalImageLoader(
                  imagePath: iconPath,
                  height: isCircle == true ? 42 : 22,
                  width: isCircle == true ? 42 : 22,
                  fit: BoxFit.fill,
                ),
              ),
              if (count != null)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: ColorRes.black,
                      shape: BoxShape.circle,
                    ),
                    child: GlobalText(
                      str: count,
                      color: ColorRes.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          sizedBoxH(2),
          GlobalText(
            str: label,
            color: ColorRes.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GlobalText(
        str: text,
        color: ColorRes.white,
        fontSize: 9,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
