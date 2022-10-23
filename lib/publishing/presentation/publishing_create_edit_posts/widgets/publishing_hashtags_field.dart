import 'package:flutter/material.dart';

Widget PublishingHashtagsField(TextEditingController hashtags) {
  return TextField(
    controller: hashtags,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Write you relation hashtags with commas",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        )),
  );
}
/*var publishingHashtags = List<String>.empty();
  publishingHashtags = hashtags.text.trim().split(',');*/