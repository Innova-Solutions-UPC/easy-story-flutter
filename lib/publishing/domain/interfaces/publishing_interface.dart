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
  Future<String> update_publishing(PublishingPost editPost);
}
