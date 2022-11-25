import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';
import 'package:flutter/material.dart';

// Future<WriteModel> getComments(){

// }

Widget PublishingItem(
  context,
  String title,
  String description,
  String content,
  String hashtags,
  String image,
  String publishId,
  String slug,
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
          image.isEmpty
              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4vgxRDCfxDtQKPA7Q_-AuKsf44qb0LHcydDgRVOQB&s"
              : image,
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
              icon: Icon(Icons.edit),
              onPressed: () async {
                Navigator.pushNamed(context, '/edit-publishing',
                    arguments: int.parse(publishId));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {},
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                Navigator.pushNamed(context, '/details-publishing',
                    arguments: slug);
              },
            )
          ],
        )
      ],
    ),
  );
}
