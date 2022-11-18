import 'package:easy_story_flutter/injections.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';
import 'package:http/http.dart' as http;

class SocialApi {
  final SocialService iamService = serviceLocator<SocialService>();
}
