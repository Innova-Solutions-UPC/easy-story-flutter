import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SignInFooterButtons(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            'Sign Up',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            primary: Color(0xff4c505b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          )),
      ElevatedButton(
        onPressed: () {},
        child: Text(
          'Did you forget your password?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          primary: Color(0xff4c505b),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    ],
  );
}
