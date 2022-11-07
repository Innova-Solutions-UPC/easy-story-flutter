import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';

abstract class WriteInterface {
  Future<String> create_publishing(
    String title,
    String description,
    String content,
    String hashtags,
    String image,
    String status,
  );
  Future<String> update_publishing(
    String title,
    String description,
    String content,
    String hashtags,
    String image,
    String status,
    String publishId,
  );
  Future<dynamic> get_all_the_posts();
  Future<List<WriteModel>> getPosts();
  Future<WriteModel> getAPost(
    String slug,
  );
}
