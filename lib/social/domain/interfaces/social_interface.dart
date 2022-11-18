import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/social/infrastructure/models/bookmark_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/comment_model.dart';
import 'package:easy_story_flutter/social/infrastructure/models/qualification_model.dart';
import 'package:http/http.dart' as http;

abstract class SocialInterface {
  // Comment
  Future<List<CommentModel>> getAllTheCommentsByPostSlug(String slug);
  Future<CommentModel> createAComment(String slug);
  Future<CommentModel> editComment(int commentId);
  //Qualification
  //Coming Soon backend
  Future<QualificationModel> createAQualification();
  Future<List<QualificationModel>> getTheQualificationsByPostSlug(String slug);
  Future<QualificationModel> editAQualification(int qualificationId);

  //Bookmarks
  Future<BookmarkModel> bookmarkAPost(int postId);
  Future<BookmarkModel> getAllTheBookmarks(int postId);
  Future<BookmarkModel> deleteABookmark(int bookmarkId);
}
