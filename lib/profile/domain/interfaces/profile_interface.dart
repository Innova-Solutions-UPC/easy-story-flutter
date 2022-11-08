import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileInterface {
  Future<ProfileModel> getMyProfile();
}
