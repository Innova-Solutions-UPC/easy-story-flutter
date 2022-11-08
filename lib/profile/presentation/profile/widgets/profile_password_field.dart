import 'package:flutter/material.dart';

Widget ProfilePasswordField(TextEditingController password) {
  return TextField(
    controller: password,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
