import 'dart:convert';

import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_local_data_provider.dart';
import 'package:easy_story_flutter/iam/infrastructure/data_sources/iam_remote_data_provider.dart';

import 'package:easy_story_flutter/common/platform/connectivity.dart';

import 'package:easy_story_flutter/social/domain/interfaces/social_interface.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_local_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_remote_data_provider.dart';
import 'package:http/http.dart' as http;

class SocialRepository implements SocialInterface {
  SocialRepository({
    required this.connectivity,
    required this.socialLocalDataProvider,
    required this.socialRemoteDataProvider,
  });

  final Connectivity connectivity;
  final SocialLocalDataProvider? socialLocalDataProvider;
  final SocialRemoteDataProvider? socialRemoteDataProvider;
  final String url = "https://easy-story-api.onrender.com/v1/auth";
}
