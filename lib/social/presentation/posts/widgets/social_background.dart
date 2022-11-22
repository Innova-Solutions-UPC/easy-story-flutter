import 'package:flutter/material.dart';

BoxDecoration SocialBackgroundImage() {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage('lib/social/assets/social_background_image.jpg'),
        fit: BoxFit.cover),
  );
}
