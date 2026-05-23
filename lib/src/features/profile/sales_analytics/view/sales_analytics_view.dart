import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nunez_official_app/src/global/components/global_appbar.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../controller/sales_analytics_controller.dart';

class SalesAnalyticsView extends StatelessWidget {
  const SalesAnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalesAnalyticsController());

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: const GlobalAppBar(
        title: "Sales Analytics",
        isBackIc: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalText(
              str: "Overview",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(15),
            Row(
              children: [
                const GlobalText(str: "Show: ", fontSize: 14, color: ColorRes.grey900),
                Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      GlobalText(
                        str: controller.selectedTimeframe.value,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                )),
              ],
            ),
            sizedBoxH(20),
            // Top Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "\$12,540",
                    "Total Revenue",
                    const Color(0xFFE8F9EE),
                    const Color(0xFF42D06B),
                  ),
                ),
                sizedBoxW(10),
                Expanded(
                  child: _buildStatCard(
                    "428",
                    "Order Sold",
                    const Color(0xFFE5F1FF),
                    const Color(0xFF3268D7),
                  ),
                ),
                sizedBoxW(10),
                Expanded(
                  child: _buildStatCard(
                    "\$29.00",
                    "Avg order value",
                    const Color(0xFFFFEFE6),
                    const Color(0xFFFF823C),
                  ),
                ),
              ],
            ),
            sizedBoxH(25),
            // Sales Figure Card (Graph Placeholder)
            _buildSalesFigureCard(),
            sizedBoxH(30),
            const GlobalText(
              str: "Performance Insights",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            sizedBoxH(15),
            _buildInsightItem("Streams longer than 45 minutes perform better."),
            _buildInsightItem("Pinned products increased purchases."),
            _buildInsightItem("Your audience is most active after 8 PM"),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          GlobalText(
            str: value,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          sizedBoxH(4),
          GlobalText(
            str: label,
            fontSize: 11,
            color: ColorRes.grey900,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSalesFigureCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalText(
            str: "Sales Figures",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          sizedBoxH(15),
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF42D06B),
                  shape: BoxShape.circle,
                ),
              ),
              sizedBoxW(8),
              const GlobalText(str: "Sales", fontSize: 14, color: ColorRes.grey900),
            ],
          ),
          sizedBoxH(20),
          // Placeholder for the Graph
          AspectRatio(
            aspectRatio: 1.5,
            child: CustomPaint(
              painter: SalesGraphPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CircleAvatar(radius: 2, backgroundColor: Colors.black),
          ),
          sizedBoxW(10),
          Expanded(
            child: GlobalText(
              str: text,
              fontSize: 15,
              color: ColorRes.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter to draw a similar wavy graph and tooltip
class SalesGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF42D06B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    // Simulating a wavy line
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5, size.width * 0.2, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.8, size.width * 0.45, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.3, size.width * 0.65, size.height * 0.55);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.8, size.width * 0.9, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.75);

    // Draw grid lines (simplified)
    final gridPaint = Paint()
      ..color = Colors.grey.shade100
      ..strokeWidth = 1;

    for (int i = 0; i <= 5; i++) {
      double y = size.height * (i / 5);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    
    // Draw Y axis labels (Placeholder)
    const textStyle = TextStyle(color: ColorRes.grey, fontSize: 10);
    _drawText(canvas, "1k", const Offset(-20, 0), textStyle);
    _drawText(canvas, "800", Offset(-25, size.height * 0.2), textStyle);
    _drawText(canvas, "600", Offset(-25, size.height * 0.4), textStyle);
    _drawText(canvas, "400", Offset(-25, size.height * 0.6), textStyle);
    _drawText(canvas, "200", Offset(-25, size.height * 0.8), textStyle);
    _drawText(canvas, "0", Offset(-10, size.height), textStyle);

    canvas.drawPath(path, paint);

    // Tooltip area at August
    double tooltipX = size.width * 0.65;
    double tooltipY = size.height * 0.55;

    // Vertical line for tooltip
    canvas.drawLine(Offset(tooltipX, tooltipY), Offset(tooltipX, size.height), paint);

    // Dot at tooltip
    canvas.drawCircle(Offset(tooltipX, tooltipY), 6, Paint()..color = const Color(0xFF42D06B));
    canvas.drawCircle(Offset(tooltipX, tooltipY), 4, Paint()..color = Colors.white);

    // Tooltip Box
    final rect = Rect.fromCenter(center: Offset(tooltipX, tooltipY - 40), width: 70, height: 45);
    final RRect rrect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
    canvas.drawRRect(rrect, Paint()..color = Colors.white..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5));
    canvas.drawRRect(rrect, Paint()..color = Colors.white);

    _drawText(canvas, "\$27632", Offset(tooltipX - 25, tooltipY - 55), const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12));
    _drawText(canvas, "August", Offset(tooltipX - 18, tooltipY - 38), const TextStyle(color: Colors.grey, fontSize: 10));

    // X axis labels
    _drawText(canvas, "May", Offset(size.width * 0.1, size.height + 5), textStyle);
    _drawText(canvas, "Jun", Offset(size.width * 0.3, size.height + 5), textStyle);
    _drawText(canvas, "Jul", Offset(size.width * 0.5, size.height + 5), textStyle);
    _drawText(canvas, "Aug", Offset(size.width * 0.7, size.height + 5), textStyle);
    _drawText(canvas, "Sep", Offset(size.width * 0.85, size.height + 5), textStyle);
    _drawText(canvas, "Oct", Offset(size.width * 0.98, size.height + 5), textStyle);
  }

  void _drawText(Canvas canvas, String text, Offset offset, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
