import 'package:flutter/material.dart';

BoxDecoration ProfileBackgroundImage() {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage('lib/profile/assets/profile_background.jpg'),
        fit: BoxFit.cover),
  );
}
