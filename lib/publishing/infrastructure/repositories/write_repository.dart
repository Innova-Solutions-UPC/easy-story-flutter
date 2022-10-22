import 'dart:convert';

import 'package:easy_story_flutter/common/platform/connectivity.dart';
import 'package:easy_story_flutter/publishing/domain/entities/publishing_post.dart';
import 'package:easy_story_flutter/publishing/domain/interfaces/publishing_interface.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_local_data_provider.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_remote_data_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';

import '../../../../common/exceptions/server_exceptions.dart';

class WriteRepository implements WriteInterface {
  WriteRepository({
    required this.connectivity,
    required this.writeLocalDataProvider,
    required this.writeRemoteDataProvider,
  });

  final Connectivity connectivity;
  final WriteLocalDataProvider? writeLocalDataProvider;
  final WriteRemoteDataProvider? writeRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/posts";

  @override
  Future<String> create_publishing(PublishingPost writePost) async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');

    if (connectivity.isConnected) {
      try {
        WriteModel writeModel = new WriteModel(
            id: writePost.id,
            title: writePost.title,
            description: writePost.description,
            status: writePost.status,
            content: writePost.content,
            image: writePost.image,
            hashtags: writePost.hashtags);
        var response = http.post(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${pref.getString('token')}',
            },
            body: jsonEncode(<String, dynamic>{
              "title": writeModel.title,
              "description": writeModel.description,
              "status": writeModel.status,
              "content": writeModel.content,
              "image":
                  "https://www.nationalgeographic.com.es/medio/2018/02/27/perros__1280x720.jpg",
              "hashtags": writeModel.hashtags
            }));
        return response.toString();
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to create a post');
    }
  }

  @override
  Future<String> update_publishing(PublishingPost editPost) async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    WriteModel writeModel = new WriteModel(
        id: editPost.id,
        title: editPost.title,
        description: editPost.description,
        status: editPost.status,
        content: editPost.content,
        image: editPost.image,
        hashtags: editPost.hashtags);
    if (connectivity.isConnected) {
      try {
        return "hello";
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to login');
    }
  }
}
