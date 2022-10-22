import 'package:easy_story_flutter/iam/application/iam_service.dart';
import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/injections.dart';
import 'package:http/http.dart' as http;

class IamApi {
  final IamService iamService = serviceLocator<IamService>();

  Future<User> register(User user) async {
    return iamService.sign_up(user);
  }

  Future<String> login(User user) async {
    return iamService.sign_in(user);
  }
}
