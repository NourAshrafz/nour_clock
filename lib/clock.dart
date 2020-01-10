import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'clockDial.dart';
import 'clock_hands/clockHands.dart';
import 'consts.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Center(
            child: AspectRatio(
              aspectRatio: 5 / 3,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      // Draw Clock Dials
                      ClockDial(),

                      // Draw Clock Hands
                      ClockHands(),

                      // Draw Text (Date + Location)
                      _buildText(context),

                      //Draw Center Point
                      _buildCenterPoint(),
                    ],
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _buildCenterPoint() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: color3,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              )
            ],
            shape: BoxShape.circle,
            color: color3,
          ),
        ),
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color4,
        ),
      ),
    );
  }

  Center _buildText(BuildContext context) {
    //Get Date
    var now = DateTime.now();
    var format = DateFormat('EEE, MMM d');
    var date = format.format(now);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Text(
            date,
            style: GoogleFonts.courgette(
                textStyle: TextStyle(shadows: [
              BoxShadow(
                color: color3,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              )
            ], color: color5, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Text(
            "Mountain View, CA",
            style: GoogleFonts.cuteFont(
                textStyle: TextStyle(shadows: [
              BoxShadow(
                color: color3,
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              )
            ], color: color3, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
