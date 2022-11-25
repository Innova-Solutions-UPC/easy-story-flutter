import 'dart:io';

import 'package:easy_story_flutter/common/exceptions/exceptions.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/widgets/publishing_status.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:easy_story_flutter/publishing/api/publishing_api.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget PublishingButtonCreate(
  context,
  String title,
  String description,
  String content,
  String hashtags,
  dynamic data,
) {
  String basename(String path) => context.basename(path);
  String urlImage = "";
  String status = EnumToString.convertToString(PublishingStatus.published);
  return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 177, 116, 164),
      onPressed: () async {
        try {
          print("object");
          final prefs = await SharedPreferences.getInstance();

          final String? information = prefs.getString('fileRecent');

          String newData = information.toString();
          File file = File(newData);
          print(file.path);
          String fileName = file.path.split('/').last;

          print(fileName);
          FirebaseStorage storage = FirebaseStorage.instance;
          Reference ref = storage.ref().child("/Books-covers/" + fileName);
          print(ref);
          UploadTask uploadTask = ref.putFile(file);
          print(uploadTask.toString());
          uploadTask.then((res) async {
            urlImage = await res.ref.getDownloadURL();
            print("url de la imagen " + urlImage);
            PublishingApi publishingApi = new PublishingApi();
            print("the " + urlImage);
            await publishingApi.create_publishing(
              title,
              description,
              content,
              hashtags,
              urlImage,
              status,
            );
          });

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
