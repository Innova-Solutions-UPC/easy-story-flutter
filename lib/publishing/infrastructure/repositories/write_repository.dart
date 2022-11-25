import 'dart:convert';
import 'dart:io';

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
  final String url = "https://easy-story-api.onrender.com/v1/";

  @override
  Future<String> create_publishing(
    String title,
    String description,
    String content,
    String hashtags,
    String image,
    String status,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    print("La imagen del link " + image);
    if (connectivity.isConnected) {
      try {
        print('hi');
        var data = hashtags.split(',').toList();

        var response = await http.post(
          Uri.parse(url + 'posts'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}',
          },
          body: jsonEncode(
            <String, dynamic>{
              "title": title,
              "description": description,
              "status": status,
              "content": content,
              "image": image,
              "hashtags": data,
            },
          ),
        );
        var value_data = jsonDecode(response.body);

        print(value_data);
        print(value_data["content"]);
        return response.body.toString();
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to create a post');
    }
  }

  @override
  Future<String> update_publishing(
    String title,
    String description,
    String content,
    String hashtags,
    String image,
    String status,
    String publishId,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    if (connectivity.isConnected) {
      try {
        var data = hashtags.split(',').toList();

        var response = await http.patch(
          Uri.parse(url + 'posts/' + publishId),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}',
          },
          body: jsonEncode(
            <String, dynamic>{
              "title": title,
              "description": description,
              "status": status,
              "content": content,
              "image":
                  "https://www.nationalgeographic.com.es/medio/2018/02/27/perros__1280x720.jpg",
              "hashtags": data,
            },
          ),
        );
        var value_data = jsonDecode(response.body);

        print(value_data);
        print(value_data["items"]);
        return response.body.toString();
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to login');
    }
  }

  @override
  Future<dynamic> get_all_the_posts() async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    //https://easy-story-api.onrender.com/v1/posts?page=1&limit=20
    if (connectivity.isConnected) {
      try {
        //feed
        final response = await http.get(
          Uri.parse(url + 'posts?page=1&limit=20'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}',
          },
        );

        return jsonDecode(response.body.toString());
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error while try to get users-posts-data');
    }
  }

  @override
  Future<List<WriteModel>> getPosts() async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    final int? userId = pref.getInt('user_id');
    final response = await http.get(
      Uri.parse(url + 'user-posts?page=1&limit=20'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      var list = json.decode(response.body)["items"] as List;
      print("La lista" + list.toString());
      var a = list
          .map((json) => WriteModel.fromJson(json))
          .where((element) => element.id == userId)
          .toList();

      print(" " + a.toString());
      return list.map((json) => WriteModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed request');
    }
  }

  @override
  Future<WriteModel> getAPost(String slug) async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    final response = await http.get(
      Uri.parse(url + 'posts/' + slug),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );
    var body = json.decode(response.body);

    return WriteModel.fromJson(body);
  }
}
