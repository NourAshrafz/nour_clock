import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'consts.dart';

class ClockDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockDialPainter(),
    );
  }
}

class ClockDialPainter extends CustomPainter {
  Paint subDotPaint;
  Paint mainDotPaint;
  Paint mainDotShadowPaint;
  TextPainter textPaint;
  TextStyle textStyle;

  ClockDialPainter() {
    subDotPaint = Paint();
    textPaint = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    textStyle = GoogleFonts.cookie(
      textStyle: TextStyle(
        shadows: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
        color: color6,
        fontWeight: FontWeight.bold,
        fontSize: 23.0,
      ),
    );
    mainDotPaint = Paint();
    mainDotShadowPaint = Paint();
    subDotPaint.color = Colors.white;
    mainDotPaint.color = color5;
    mainDotShadowPaint.color = color5;
    mainDotShadowPaint.maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var angle = 2 * pi / 60;
    var width = size.width / 2;
    var height = size.height / 2;
    canvas.save();
    canvas.translate(width, height);
    //draw the Dots
    for (var counter = 0; counter < 60; counter++) {
      if (counter == 1 ||
          counter == 14 ||
          counter == 16 ||
          counter == 29 ||
          counter == 31 ||
          counter == 44 ||
          counter == 46 ||
          counter == 59) {
        onDrawDot(canvas, Offset(0.0, -height - 2), 3.0, subDotPaint);
      } else if (counter == 2 ||
          counter == 13 ||
          counter == 17 ||
          counter == 28 ||
          counter == 32 ||
          counter == 43 ||
          counter == 47 ||
          counter == 58) {
        onDrawDot(canvas, Offset(0.0, -height - 4), 3.0, subDotPaint);
      } else if (counter == 3 ||
          counter == 12 ||
          counter == 18 ||
          counter == 27 ||
          counter == 33 ||
          counter == 42 ||
          counter == 48 ||
          counter == 57) {
        onDrawDot(canvas, Offset(0.0, -height - 8), 3.0, subDotPaint);
      } else if (counter == 4 ||
          counter == 11 ||
          counter == 19 ||
          counter == 26 ||
          counter == 34 ||
          counter == 41 ||
          counter == 49 ||
          counter == 56) {
        onDrawDot(canvas, Offset(0.0, -height - 12), 3.0, subDotPaint);
      } else if (counter == 5 ||
          counter == 10 ||
          counter == 20 ||
          counter == 25 ||
          counter == 35 ||
          counter == 40 ||
          counter == 50 ||
          counter == 55) {
        onDrawDot(canvas, Offset(0.0, -height - 16), 6.0, mainDotShadowPaint);
        onDrawDot(canvas, Offset(0.0, -height - 16), 5.0, mainDotPaint);
      } else if (counter == 6 ||
          counter == 9 ||
          counter == 21 ||
          counter == 24 ||
          counter == 36 ||
          counter == 39 ||
          counter == 51 ||
          counter == 54) {
        onDrawDot(canvas, Offset(0.0, -height - 18), 3.0, subDotPaint);
      } else if (counter == 7 ||
          counter == 8 ||
          counter == 22 ||
          counter == 23 ||
          counter == 37 ||
          counter == 38 ||
          counter == 52 ||
          counter == 53) {
        onDrawDot(canvas, Offset(0.0, -height - 20), 3.0, subDotPaint);
      } else {
        onDrawDot(canvas, Offset(0.0, -height - 2), 6.0, mainDotShadowPaint);
        onDrawDot(canvas, Offset(0.0, -height - 2), 5.0, mainDotPaint);
      }
      //draw the text
      if (counter % 5 == 0) {
        canvas.save();
        canvas.translate(0.0, -height + 20.0);

        textPaint.text = TextSpan(
          text: '${counter == 0 ? 12 : counter ~/ 5}',
          style: textStyle,
        );
        // text paint vertically
        canvas.rotate(-angle * counter);
        textPaint.layout();
        textPaint.paint(
            canvas, Offset(-(textPaint.width / 2), -(textPaint.height / 2)));
        canvas.restore();
      }
      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  onDrawDot(Canvas canvas, Offset offset, double radius, Paint paint) {
    canvas.drawOval(Rect.fromCircle(radius: radius, center: offset), paint);
  }
}
