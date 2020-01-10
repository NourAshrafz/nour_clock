import 'dart:math';

import 'package:flutter/material.dart';

import '../consts.dart';

class SecondPainter extends CustomPainter {
  Paint secondOuterCirclePaint;
  Paint secondInnerCirclePaint;
  Paint secondOuterCircleShadowPaint;
  int seconds;

  SecondPainter({this.seconds}) {
    secondOuterCirclePaint = Paint();
    secondInnerCirclePaint = Paint();
    secondOuterCircleShadowPaint = Paint();
    secondOuterCirclePaint.color = Colors.white;
    secondOuterCirclePaint.style = PaintingStyle.fill;
    secondInnerCirclePaint.color = color3;
    secondInnerCirclePaint.style = PaintingStyle.fill;
    secondOuterCircleShadowPaint.color = Colors.white;
    secondOuterCircleShadowPaint.style = PaintingStyle.fill;
    secondOuterCircleShadowPaint.maskFilter =
        MaskFilter.blur(BlurStyle.normal, 3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height / 2;
    var width = size.width / 2;
    canvas.save();
    canvas.translate(width, height);
    canvas.rotate(2 * pi * seconds / 60);
    if (seconds == 1 ||
        seconds == 14 ||
        seconds == 16 ||
        seconds == 29 ||
        seconds == 31 ||
        seconds == 44 ||
        seconds == 46 ||
        seconds == 59) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 2), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 2), 10, secondOuterCirclePaint);
      onDrawCircle(canvas, Offset(0.0, -height - 2), 8, secondInnerCirclePaint);
    } else if (seconds == 2 ||
        seconds == 13 ||
        seconds == 17 ||
        seconds == 28 ||
        seconds == 32 ||
        seconds == 43 ||
        seconds == 47 ||
        seconds == 58) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 4), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 4), 10, secondOuterCirclePaint);
      onDrawCircle(canvas, Offset(0.0, -height - 4), 8, secondInnerCirclePaint);
    } else if (seconds == 3 ||
        seconds == 12 ||
        seconds == 18 ||
        seconds == 27 ||
        seconds == 33 ||
        seconds == 42 ||
        seconds == 48 ||
        seconds == 57) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 8), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 8), 10, secondOuterCirclePaint);
      onDrawCircle(canvas, Offset(0.0, -height - 8), 8, secondInnerCirclePaint);
    } else if (seconds == 4 ||
        seconds == 11 ||
        seconds == 19 ||
        seconds == 26 ||
        seconds == 34 ||
        seconds == 41 ||
        seconds == 49 ||
        seconds == 56) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 12), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 12), 10, secondOuterCirclePaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 12), 8, secondInnerCirclePaint);
    } else if (seconds == 5 ||
        seconds == 10 ||
        seconds == 20 ||
        seconds == 25 ||
        seconds == 35 ||
        seconds == 40 ||
        seconds == 50 ||
        seconds == 55) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 16), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 16), 10, secondOuterCirclePaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 16), 8, secondInnerCirclePaint);
    } else if (seconds == 6 ||
        seconds == 9 ||
        seconds == 21 ||
        seconds == 24 ||
        seconds == 36 ||
        seconds == 39 ||
        seconds == 51 ||
        seconds == 54) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 18), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 18), 10, secondOuterCirclePaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 18), 8, secondInnerCirclePaint);
    } else if (seconds == 7 ||
        seconds == 8 ||
        seconds == 22 ||
        seconds == 23 ||
        seconds == 37 ||
        seconds == 38 ||
        seconds == 52 ||
        seconds == 53) {
      onDrawCircle(
          canvas, Offset(0.0, -height - 20), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 20), 10, secondOuterCirclePaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 20), 8, secondInnerCirclePaint);
    } else {
      onDrawCircle(
          canvas, Offset(0.0, -height - 2), 11, secondOuterCircleShadowPaint);
      onDrawCircle(
          canvas, Offset(0.0, -height - 2), 10, secondOuterCirclePaint);
      onDrawCircle(canvas, Offset(0.0, -height - 2), 8, secondInnerCirclePaint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondPainter oldDelegate) {
    return seconds != oldDelegate.seconds;
  }

  onDrawCircle(Canvas canvas, Offset offset, double radius, Paint paint) {
    canvas.drawOval(Rect.fromCircle(radius: radius, center: offset), paint);
  }
}
