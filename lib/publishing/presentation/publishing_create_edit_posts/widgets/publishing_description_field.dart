import 'package:flutter/material.dart';

Widget PublishingDescriptionField(TextEditingController description) {
  return TextField(
    controller: description,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        )),
  );
}
