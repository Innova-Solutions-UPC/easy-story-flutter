import 'package:flutter/material.dart';

Widget ProfileBioField(TextEditingController bio) {
  return TextField(
    controller: bio,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: "Bio",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
