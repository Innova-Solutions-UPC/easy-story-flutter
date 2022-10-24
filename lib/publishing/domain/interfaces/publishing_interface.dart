import 'package:easy_story_flutter/publishing/domain/entities/publishing_post.dart';

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
  Future<dynamic> get_all_my_posts();
}
