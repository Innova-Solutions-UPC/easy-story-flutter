import 'package:flutter/material.dart';

BoxDecoration SignInBackgroundImage() {
  return BoxDecoration(
    image: DecorationImage(
        image:
            AssetImage('lib/publishing/assets/publishing_background_image.jpg'),
        fit: BoxFit.cover),
  );
}
