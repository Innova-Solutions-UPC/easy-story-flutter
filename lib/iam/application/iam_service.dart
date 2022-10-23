import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/iam/infrastructure/repositories/iam_repository.dart';
import 'package:http/http.dart' as http;

class IamService {
  const IamService({
    required this.repository,
  });

  final IamRepository repository;

  Future<User> sign_up(User user) async {
    return repository.sign_up(user);
  }

  Future<String> sign_in(String email, String password) async {
    return repository.sign_in(email, password);
  }
}
