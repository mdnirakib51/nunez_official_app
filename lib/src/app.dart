import 'package:flutter/material.dart';
import 'app/routes/app_route.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteKeys.splash,
      getPages: AppPages.pages,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const _NotFoundScreen(),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A12),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF6C5CE7).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_off_rounded,
                color: Color(0xFF6C5CE7),
                size: 38,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '404',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -2,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFFa29bfe),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'এই route টি exist করে না।',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF8888aa),
              ),
            ),

            const SizedBox(height: 36),

            TextButton(
              onPressed: () => Get.offAllNamed(AppRouteKeys.splash),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7).withOpacity(0.15),
                foregroundColor: const Color(0xFFa29bfe),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: Color(0xFF6C5CE7),
                    width: 0.5,
                  ),
                ),
              ),
              child: const Text(
                'Go to Home',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}