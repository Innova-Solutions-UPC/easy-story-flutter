import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/iam/infrastructure/repositories/iam_repository.dart';
import 'package:easy_story_flutter/social/infrastructure/repositories/social_repository.dart';
import 'package:http/http.dart' as http;

class SocialService {
  const SocialService({
    required this.repository,
  });

  final SocialRepository repository;
}
