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
  Future<String> sign_in(String email, String password) async {
    if (connectivity.isConnected) {
      try {
        var response = await http.post(
          Uri.parse(url + '/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, dynamic>{
              "email": email,
              "password": password,
            },
          ),
        );
        var value_data = jsonDecode(response.body);
        final pref = await SharedPreferences.getInstance();
        pref.setString('token', value_data['tokens']['accessToken']);
        pref.setInt('user_id', value_data['authenticatedUser']['id']);
        pref.setString('username', value_data['authenticatedUser']['username']);
        pref.setString('email', value_data['authenticatedUser']['email']);
        pref.setBool('verified', value_data['authenticatedUser']['verified']);
        print(response.statusCode);
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
