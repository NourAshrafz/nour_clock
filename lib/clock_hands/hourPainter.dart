import 'dart:math';

import 'package:flutter/material.dart';

import '../consts.dart';

class HourPainter extends CustomPainter {
  Paint hourHandPaint;
  Paint hourHandShadowPaint;
  int hours;
  int minutes;

  HourPainter({this.hours, this.minutes}) {
    hourHandPaint = Paint();
    hourHandShadowPaint = Paint();
    hourHandPaint.color = Colors.white;
    hourHandPaint.style = PaintingStyle.fill;
    hourHandShadowPaint.color = color3;
    hourHandShadowPaint.style = PaintingStyle.fill;
    hourHandShadowPaint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width / 2;
    var height = size.height / 2;
    canvas.save();
    canvas.translate(width, height);
    canvas.rotate(hours >= 12
        ? 2 * pi * ((hours - 12) / 12 + (minutes / 720))
        : 2 * pi * ((hours / 12) + (minutes / 720)));
    Path path = Path();
    path.moveTo(-4.0, 0.0);
    path.lineTo(-4.0, -height + height / 2);
    path.quadraticBezierTo(
        -3, (-height + height / 2) - 4, 0, (-height + height / 2) - 4);
    path.quadraticBezierTo(
        3, (-height + height / 2) - 4, 4, (-height + height / 2));
    path.lineTo(4.0, 0.0);
    path.close();
    canvas.drawPath(path, hourHandShadowPaint);
    canvas.drawPath(path, hourHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourPainter oldDelegate) {
    return true;
  }
}
