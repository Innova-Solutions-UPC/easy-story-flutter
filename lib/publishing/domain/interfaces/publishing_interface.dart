import 'package:easy_story_flutter/publishing/domain/entities/publishing_post.dart';

abstract class WriteInterface {
  Future<String> create_publishing(PublishingPost writePost);
  Future<String> update_publishing(PublishingPost editPost);
}
