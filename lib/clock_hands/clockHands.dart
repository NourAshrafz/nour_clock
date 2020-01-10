import 'dart:async';

import 'package:flutter/material.dart';

import 'hourPainter.dart';
import 'minutePainter.dart';
import 'secondPainter.dart';

class ClockHands extends StatefulWidget {
  @override
  _ClockHandState createState() => _ClockHandState();
}

class _ClockHandState extends State<ClockHands> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            width: double.infinity,
            child: Stack(fit: StackFit.expand, children: <Widget>[
              CustomPaint(
                painter:
                    HourPainter(hours: dateTime.hour, minutes: dateTime.minute),
              ),
              CustomPaint(
                painter: MinutePainter(
                    minutes: dateTime.minute, seconds: dateTime.second),
              ),
              CustomPaint(
                painter: SecondPainter(seconds: dateTime.second),
              ),
            ])));
  }
}
