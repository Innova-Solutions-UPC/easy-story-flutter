import 'package:flutter/material.dart';

Widget PublishingContentField(TextEditingController title) {
  return TextField(
    controller: title,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Content",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        )),
  );
}
