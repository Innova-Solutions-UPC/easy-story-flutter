import 'package:flutter/material.dart';

Widget SignInPasswordField(TextEditingController password) {
  return TextField(
    controller: password,
    style: TextStyle(),
    obscureText: true,
    decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}
