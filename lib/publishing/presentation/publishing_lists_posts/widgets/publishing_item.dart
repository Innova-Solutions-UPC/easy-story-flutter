import 'package:easy_story_flutter/publishing/presentation/publishing_lists_posts/widgets/publishing_getIcon.dart';

import 'package:flutter/material.dart';

Widget PublishingItem(
  context,
  String title,
  String description,
  String content,
  String hashtags,
  String image,
  int publishId,
) {
  return Card(
    elevation: 1.0,
    margin: EdgeInsets.only(bottom: 2.0, top: 14.0, left: 15.0, right: 15.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        Image.network(
          image,
          fit: BoxFit.fill,
        ),
        ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                //for future assignments use to bookmark.
              },
              icon: getIcon(false),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                Navigator.pushNamed(context, '/edit-publishing',
                    arguments: publishId);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {},
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {},
            )
          ],
        )
      ],
    ),
  );
}
