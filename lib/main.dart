import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'clock.dart';
import 'consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //set Orientation to Landscape Only

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Nour_Clock',
      theme: ThemeData(primaryColor: color3),
      home: Clock(),
    );
  }
}
