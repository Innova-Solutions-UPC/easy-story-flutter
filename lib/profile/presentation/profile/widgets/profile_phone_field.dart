import 'package:flutter/material.dart';

Widget ProfilePhoneField(TextEditingController phone) {
  return TextField(
    controller: phone,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "Phone",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
