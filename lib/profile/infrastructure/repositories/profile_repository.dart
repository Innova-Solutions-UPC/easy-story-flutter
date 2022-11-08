import 'dart:convert';

import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_local_data_provider.dart';
import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_remote_data_provider.dart';
import 'package:easy_story_flutter/common/exceptions/server_exceptions.dart';
import 'package:easy_story_flutter/common/platform/connectivity.dart';
import 'package:easy_story_flutter/iam/domain/entities/user.dart';
import 'package:easy_story_flutter/profile/infrastructure/data_sources/profile_local_data_provider.dart';
import 'package:easy_story_flutter/profile/infrastructure/data_sources/profile_remote_data_provider.dart';
import 'package:easy_story_flutter/profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/interfaces/profile_interface.dart';

class ProfileRepository implements ProfileInterface {
  ProfileRepository({
    required this.connectivity,
    required this.profileLocalDataProvider,
    required this.profileRemoteDataProvider,
  });

  final Connectivity connectivity;
  final ProfileLocalDataProvider? profileLocalDataProvider;
  final ProfileRemoteDataProvider? profileRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/users/";

  @override
  Future<ProfileModel> getMyProfile() async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString('token');
    final String? username = pref.getString('username');
    final response = await http.get(
      Uri.parse(url + username.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );
    var body = json.decode(response.body);

    return ProfileModel.fromJson(body);
  }
}
