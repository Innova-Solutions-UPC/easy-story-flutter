import 'package:flutter/material.dart';

Widget ProfileUserNameField(TextEditingController userName) {
  return TextField(
    controller: userName,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "UserName",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
