import 'dart:convert';

import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_local_data_provider.dart';
import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_remote_data_provider.dart';
import 'package:easy_story_flutter/common/exceptions/server_exceptions.dart';
import 'package:easy_story_flutter/common/platform/connectivity.dart';
import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/iam/domain/interfaces/iam_interface.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IamRepository implements IamInterface {
  IamRepository({
    required this.connectivity,
    required this.iamLocalDataProvider,
    required this.iamRemoteDataProvider,
  });

  final Connectivity connectivity;
  final IamLocalDataProvider? iamLocalDataProvider;
  final IamRemoteDataProvider? iamRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/auth";

  @override
  Future<String> sign_in(User user) async {
    if (connectivity.isConnected) {
      try {
        var response = await http.post(Uri.parse(url + '/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              "email": user.email,
              "password": user.password,
              "rememberMe": true,
              "token": "string"
            }));
        return response.body.toString();
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to login');
    }
  }

  @override
  Future<User> sign_up(User user) async {
    //final pref = await SharedPreferences.getInstance();
    if (connectivity.isConnected) {
      try {
        throw Exception('error when trying to register');
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      throw Exception('error when trying to register');
    }
  }
}
