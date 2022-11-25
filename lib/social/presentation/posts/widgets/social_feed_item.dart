import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

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
  return Container(
      padding: new EdgeInsets.all(32.0),
      height: 350,
      child: GestureDetector(
        onTap: () async => {
          Navigator.pushNamed(context, '/detail-feed-post', arguments: slug)
        },
        child: Card(
          color: HexColor("193f6c "),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  child: Image.network((image.isEmpty)
                      ? "https://firebasestorage.googleapis.com/v0/b/easy-story-5040d.appspot.com/o/Books-covers%2FPhotoRoom_20220124_144152.png?alt=media&token=993d992f-8468-49b5-834a-17bfd7f7ec1f"
                      : image),
                ),
                Card(
                  margin: EdgeInsets.all(35.0),
                  color: HexColor("0844a6 "),
                  child: ListTile(
                    title: Text(title),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
