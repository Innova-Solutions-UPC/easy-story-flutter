import 'dart:io';
import 'dart:convert';
import 'package:easy_story_flutter/common/platform/connectivity.dart';
import 'package:easy_story_flutter/social/domain/interfaces/social_interface.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_local_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_remote_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/models/post_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/qualification_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/bookmark_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/exceptions/server_exceptions.dart';

class SocialRepository implements SocialInterface {
  SocialRepository({
    required this.connectivity,
    required this.socialLocalDataProvider,
    required this.socialRemoteDataProvider,
  });

  final Connectivity connectivity;
  final SocialLocalDataProvider? socialLocalDataProvider;
  final SocialRemoteDataProvider? socialRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/";

  @override
  Future<BookmarkModel> bookmarkAPost(int postId) async {
    // TODO: implement bookmarkAPost
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> createAComment(
    String slug,
    String content,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    if (connectivity.isConnected) {
      try {
        var response = await http.post(
          Uri.parse(url + 'posts/${slug}/comments'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${token}',
          },
          body: jsonEncode(
            <String, dynamic>{
              "content": content,
            },
          ),
        );
        var value_data = jsonDecode(response.body);

        print(value_data);
        print(value_data["content"]);
        return CommentModel.fromJson(value_data);
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to create a comment');
    }
  }

  @override
  Future<QualificationModel> createAQualification() async {
    // TODO: implement createAQualification
    throw UnimplementedError();
  }

  @override
  Future<BookmarkModel> deleteABookmark(int bookmarkId) async {
    // TODO: implement deleteABookmark
    throw UnimplementedError();
  }

  @override
  Future<QualificationModel> editAQualification(int qualificationId) async {
    // TODO: implement editAQualification
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> editComment(int commentId) async {
    // TODO: implement editComment
    throw UnimplementedError();
  }

  @override
  Future<BookmarkModel> getAllTheBookmarks(int postId) async {
    // TODO: implement getAllTheBookmarks
    throw UnimplementedError();
  }

  @override
  Future<List<CommentModel>> getAllTheCommentsByPostSlug(String slug) async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');

    final response = await http.get(
      Uri.parse(url + 'posts/${slug}/comments/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      var list = json.decode(response.body)["items"] as List;
      print("La lista" + list.toString());
      var a = list.map((json) => CommentModel.fromJson(json)).toList();

      print(" " + a.toString());
      return list.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed request');
    }
  }

  @override
  Future<List<QualificationModel>> getTheQualificationsByPostSlug(
      String slug) async {
    // TODO: implement getTheQualificationsByPostSlug
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllThePosts() async {
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
      var a = list.map((json) => PostModel.fromJson(json)).toList();

      print(" " + a.toString());
      return list.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed request');
    }
  }

  @override
  Future<PostModel> getAnPost(String slug) async {
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

    return PostModel.fromJson(body);
  }
}
