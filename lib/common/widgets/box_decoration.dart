import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

BoxDecoration backGroundDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor('#2c3e50'),
      HexColor('#bdc3c7'),
    ],
  ));
}
