import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class IamInterface {
  Future<User> sign_up(User user);
  Future<String> sign_in(User user);
}
