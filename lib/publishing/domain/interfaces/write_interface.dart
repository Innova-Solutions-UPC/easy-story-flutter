import 'package:easy_story_flutter/publishing/domain/entities/write_post.dart';
import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;

abstract class WriteInterface {
  Future<String> create_publishing(WritePost writePost);
  Future<String> update_publishing(WritePost editPost);
}
