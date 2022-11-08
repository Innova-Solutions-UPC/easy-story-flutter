import 'package:flutter/material.dart';

Widget ProfileEmailField(TextEditingController email) {
  return TextField(
    controller: email,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
