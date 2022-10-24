import 'package:easy_story_flutter/common/exceptions/exceptions.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/widgets/publishing_status.dart';

import 'package:flutter/material.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:enum_to_string/enum_to_string.dart';

Widget PublishingButtonCreate(
  context,
  String title,
  String description,
  String content,
  String hashtags,
  String image,
) {
  String status = EnumToString.convertToString(PublishingStatus.published);
  return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 177, 116, 164),
      onPressed: () async {
        try {
          print("object");
          PublishingApi publishingApi = new PublishingApi();
          print(title + description + content + hashtags + image + status);
          await publishingApi.create_publishing(
            title,
            description,
            content,
            hashtags,
            image,
            status,
          );
          Navigator.pushNamed(context, '/user-posts');
        } catch (e) {
          print(e);
          return ServerException()();
        }
      },
      child: Icon(
        Icons.add,
      ));
}
