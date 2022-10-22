import 'package:flutter/cupertino.dart';

BoxDecoration SignInBackgroundImage() {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage('lib/iam/assets/sign-in.png'), fit: BoxFit.cover),
  );
}
