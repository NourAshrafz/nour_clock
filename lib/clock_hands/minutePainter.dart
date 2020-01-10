import 'dart:math';

import 'package:flutter/material.dart';

import '../Consts.dart';

class MinutePainter extends CustomPainter {
  Paint minuteHandPaint;
  Paint minuteHandShadowPaint;
  int minutes;
  int seconds;

  MinutePainter({this.minutes, this.seconds}) {
    minuteHandPaint = Paint();
    minuteHandShadowPaint = Paint();
    minuteHandPaint.color = Colors.white;
    minuteHandPaint.style = PaintingStyle.fill;
    minuteHandShadowPaint.color = color3;
    minuteHandShadowPaint.style = PaintingStyle.fill;
    minuteHandShadowPaint.maskFilter = MaskFilter.blur(BlurStyle.normal, 7);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width / 2;
    var height = size.height / 2;
    canvas.save();
    canvas.translate(width, height);
    canvas.rotate(2 * pi * ((minutes + (seconds / 60)) / 60));
    Path path = Path();
    path.moveTo(-4.0, 0.0);
    path.lineTo(-4.0, -height + height / 3);
    path.quadraticBezierTo(
        -3, (-height + height / 3) - 4, 0, (-height + height / 3) - 4);
    path.quadraticBezierTo(
        3, (-height + height / 3) - 4, 4, (-height + height / 3));
    path.lineTo(4.0, 0.0);
    path.close();
    canvas.drawPath(path, minuteHandShadowPaint);
    canvas.drawPath(path, minuteHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(MinutePainter oldDelegate) {
    return true;
  }
}
