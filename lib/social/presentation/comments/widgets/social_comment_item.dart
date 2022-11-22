import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

Widget SocialCommentItem(
    context, String slug, String content, String authorName) {
  return Card(
    color: Colors.blueAccent[100],
    elevation: 1.0,
    margin: EdgeInsets.only(bottom: 2.0, top: 14.0, left: 15.0, right: 15.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        ListTile(
          title: Text(authorName),
          subtitle: Text(content),
        ),
      ],
    ),
  );
}
