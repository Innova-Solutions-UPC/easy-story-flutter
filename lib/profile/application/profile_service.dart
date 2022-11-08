import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/iam/infrastructure/repositories/iam_repository.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;

import '../infrastructure/repositories/profile_repository.dart';

class ProfileService {
  const ProfileService({
    required this.repository,
  });

  final ProfileRepository repository;

  Future<ProfileModel> getMyProfile() async {
    return await repository.getMyProfile();
  }
}
