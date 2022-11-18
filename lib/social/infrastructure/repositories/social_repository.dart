import 'dart:convert';

import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_local_data_provider.dart';
import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_remote_data_provider.dart';

import 'package:easy_story_flutter/common/platform/connectivity.dart';

import 'package:easy_story_flutter/social/domain/interfaces/social_interface.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_local_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_remote_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/models/qualification_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/bookmark_model.dart';
import 'package:http/http.dart' as http;

class SocialRepository implements SocialInterface {
  SocialRepository({
    required this.connectivity,
    required this.socialLocalDataProvider,
    required this.socialRemoteDataProvider,
  });

  final Connectivity connectivity;
  final SocialLocalDataProvider? socialLocalDataProvider;
  final SocialRemoteDataProvider? socialRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/auth";

  @override
  Future<BookmarkModel> bookmarkAPost(int postId) async {
    // TODO: implement bookmarkAPost
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> createAComment(String slug) async {
    // TODO: implement createAComment
    throw UnimplementedError();
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
    // TODO: implement getAllTheCommentsByPostSlug
    throw UnimplementedError();
  }

  @override
  Future<List<QualificationModel>> getTheQualificationsByPostSlug(
      String slug) async {
    // TODO: implement getTheQualificationsByPostSlug
    throw UnimplementedError();
  }
}
