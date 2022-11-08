import 'package:easy_story_flutter/iam/application/iam_service.dart';
import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/injections.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;

import '../application/profile_service.dart';

class ProfileApi {
  final ProfileService profileService = serviceLocator<ProfileService>();

  Future<ProfileModel> getMyProfile() async {
    return await profileService.getMyProfile();
  }
}
