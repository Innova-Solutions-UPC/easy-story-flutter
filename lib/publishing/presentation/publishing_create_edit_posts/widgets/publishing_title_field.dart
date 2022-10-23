import 'package:flutter/material.dart';

Widget PublishingTitleField(TextEditingController title) {
  return TextField(
    controller: title,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "Title",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
