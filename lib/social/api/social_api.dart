import 'package:easy_story_flutter/injections.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';
import 'package:easy_story_flutter/social/infrastructure/models/bookmark_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/qualification_model.dart';
import 'package:http/http.dart' as http;

class SocialApi {
  final SocialService socialService = serviceLocator<SocialService>();
  Future<BookmarkModel> bookmarkAPost(int postId) async {
    return socialService.bookmarkAPost(postId);
  }

  Future<CommentModel> createAComment(String slug) async {
    return socialService.createAComment(slug);
  }

  Future<QualificationModel> createAQualification() async {
    return socialService.createAQualification();
  }

  Future<BookmarkModel> deleteABookmark(int bookmarkId) async {
    return socialService.deleteABookmark(bookmarkId);
  }

  Future<QualificationModel> editAQualification(int qualificationId) async {
    return socialService.editAQualification(qualificationId);
  }

  Future<CommentModel> editComment(int commentId) async {
    return socialService.editComment(commentId);
  }

  Future<BookmarkModel> getAllTheBookmarks(int postId) async {
    return socialService.getAllTheBookmarks(postId);
  }

  Future<List<CommentModel>> getAllTheCommentsByPostSlug(String slug) async {
    return socialService.getAllTheCommentsByPostSlug(slug);
  }

  Future<List<QualificationModel>> getTheQualificationsByPostSlug(
      String slug) async {
    return socialService.getTheQualificationsByPostSlug(slug);
  }
}
