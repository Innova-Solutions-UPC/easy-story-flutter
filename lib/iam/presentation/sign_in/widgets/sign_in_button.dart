import 'package:flutter/material.dart';
import 'package:easy_story_flutter/iam/api/iam_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../../common/exceptions/server_exceptions.dart';
import '../../../domain/entities/user.dart';

Widget SignInButton(context, String email, String password) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: Color(0xff4c505b),
    child: IconButton(
        color: Colors.white,
        onPressed: () async {
          try {
            IamApi iamApi = new IamApi();
            await iamApi.login(email, password);
            Navigator.pushNamed(context, '/user-posts');
          } catch (e) {
            return ServerException()();
          }
        },
        icon: Icon(
          Icons.arrow_forward,
        )),
  );
}
