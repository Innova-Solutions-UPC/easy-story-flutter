import 'package:easy_story_flutter/publishing/infrastructure/repositories/write_repository.dart';

import '../domain/entities/publishing_post.dart';

class PublishingService {
  const PublishingService({
    required this.repository,
  });
  final WriteRepository repository;
  Future<String> create_publishing(PublishingPost writePost) {
    return repository.create_publishing(writePost);
  }

  Future<String> edit_publishing(PublishingPost editPost) {
    return repository.update_publishing(editPost);
  }
}
