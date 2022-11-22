import 'package:flutter/material.dart';

Widget SocialFeedItem(
  context,
  String title,
  String description,
  String content,
  String hashtags,
  String image,
  String publishId,
  String slug,
  bool isBookmarked,
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
              icon: (isBookmarked)
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_add_outlined),
              onPressed: () async {
                //bookmark
              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                Navigator.pushNamed(context, '/detail-feed-post',
                    arguments: slug);
              },
            )
          ],
        )
      ],
    ),
  );
}
