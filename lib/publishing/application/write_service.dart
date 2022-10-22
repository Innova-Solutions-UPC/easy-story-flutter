import 'package:easy_story_flutter/publishing/infrastructure/repositories/write_repository.dart';

import '../domain/entities/write_post.dart';

class WriteService {
  const WriteService({
    required this.repository,
  });
  final WriteRepository repository;
  Future<String> create_publishing(WritePost writePost) {
    return repository.create_publishing(writePost);
  }

  Future<String> edit_publishing(WritePost editPost) {
    return repository.update_publishing(editPost);
  }
}
