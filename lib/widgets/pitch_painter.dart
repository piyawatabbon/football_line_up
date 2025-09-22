import 'package:flutter/material.dart';

/// วาดพื้นสนามแบบเรียบ: เทาเข้ม, เส้นขอบ, เส้นเขตโทษพอเป็นสัญลักษณ์
class PitchPainter extends CustomPainter {
  final bool isBottom;

  PitchPainter({required this.isBottom});

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFF2F3A43);
    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // เติมพื้น
    canvas.drawRect(Offset.zero & size, bg);

    // เส้นขอบครึ่งสนาม - ชิดขอบ
    // วาดเฉพาะด้านข้างและด้านประตู ไม่วาดด้านกึ่งกลาง
    // ครึ่งบน: วาดขอบซ้าย, ขวา, บน
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), line); // ซ้าย
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, size.height), line); // ขวา
    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), line); // บน

    // เส้นกึ่งกลางสนาม (เส้นแบ่งซีก)
    // ครึ่งบน: วาดเส้นที่ด้านล่าง (ขอบกึ่งกลาง)
    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), line);

    // ครึ่งวงกลมกึ่งกลางสนาม - ใหญ่ขึ้น
    final centerX = size.width / 2;
    final centerCircleY = size.height; // ชิดขอบกึ่งกลาง
    final radius = 35.0; // เพิ่มจาก 22 เป็น 35

    // วาดครึ่งวงกลมที่อยู่ในพื้นที่ครึ่งสนามนี้
    final rect = Rect.fromCenter(
      center: Offset(centerX, centerCircleY),
      width: radius * 2,
      height: radius * 2,
    );

    final startAngle = 3.14159; // 180° สำหรับครึ่งบน
    final sweepAngle = 3.14159; // 180° (ครึ่งวงกลม)

    canvas.drawArc(rect, startAngle, sweepAngle, false, line);

    // เขตโทษคร่าว ๆ - ชิดขอบ
    final boxH = size.height * 0.22;
    final boxW = size.width * 0.72;
    final goalSideY = 0.0; // ชิดขอบ
    final penalty = Rect.fromCenter(
      center: Offset(size.width / 2, boxH / 2),
      width: boxW,
      height: boxH,
    );
    canvas.drawRect(penalty, line);

    // จุดโทษเล็ก ๆ
    final pSpot = Offset(size.width / 2, boxH - boxH * 0.35);
    canvas.drawCircle(pSpot, 3, line);

    // เส้นประตูเล็ก ๆ
    canvas.drawLine(Offset(size.width * 0.46, goalSideY),
        Offset(size.width * 0.54, goalSideY), line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
