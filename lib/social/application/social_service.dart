import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/iam/infrastructure/repositories/iam_repository.dart';
import 'package:easy_story_flutter/social/infrastructure/models/bookmark_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/qualification_model.dart';
import 'package:easy_story_flutter/social/infrastructure/repositories/social_repository.dart';
import 'package:http/http.dart' as http;

class SocialService {
  const SocialService({
    required this.repository,
  });

  final SocialRepository repository;

  Future<BookmarkModel> bookmarkAPost(int postId) async {
    return repository.bookmarkAPost(postId);
  }

  Future<CommentModel> createAComment(String slug) async {
    return repository.createAComment(slug);
  }

  Future<QualificationModel> createAQualification() async {
    return repository.createAQualification();
  }

  Future<BookmarkModel> deleteABookmark(int bookmarkId) async {
    return repository.deleteABookmark(bookmarkId);
  }

  Future<QualificationModel> editAQualification(int qualificationId) async {
    return repository.editAQualification(qualificationId);
  }

  Future<CommentModel> editComment(int commentId) async {
    return repository.editComment(commentId);
  }

  Future<BookmarkModel> getAllTheBookmarks(int postId) async {
    return repository.getAllTheBookmarks(postId);
  }

  Future<List<CommentModel>> getAllTheCommentsByPostSlug(String slug) async {
    return repository.getAllTheCommentsByPostSlug(slug);
  }

  Future<List<QualificationModel>> getTheQualificationsByPostSlug(
      String slug) async {
    return repository.getTheQualificationsByPostSlug(slug);
  }
}
