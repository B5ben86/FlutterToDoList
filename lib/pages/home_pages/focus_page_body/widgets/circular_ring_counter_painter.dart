import 'dart:math';

import 'package:flutter/material.dart';

class CircularRingCounterPainter extends CustomPainter {
  final int counter;
  final int maxCounter;

  CircularRingCounterPainter({required this.counter, required this.maxCounter});

  @override
  void paint(Canvas canvas, Size size) {
    //1. 找出圆心和半径
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    //绘制背景圆环
    Paint bgPaint = Paint()
      ..color = const Color(0xff555555)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius / 10;
    canvas.drawCircle(
      Offset(centerX, centerY),
      radius - bgPaint.strokeWidth / 2,
      bgPaint,
    );

    //绘制进度圆环
    Paint progressPaint = Paint()
      ..color = const Color(0xff8687e7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius / 10
      ..strokeCap = StrokeCap.round;

    double progress = counter / maxCounter;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius - progressPaint.strokeWidth / 2,
      ),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );

    //绘制计数器值
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: getTimerString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.normal,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(centerX - textPainter.width / 2, centerY - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CircularRingCounterPainter oldDelegate) {
    return oldDelegate.counter != counter;
  }

  String getTimerString() {
    Duration duration = Duration(seconds: counter);
    int minutes = duration.inMinutes;
    int remainSeconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainSeconds.toString().padLeft(2, '0')}';
  }
}
