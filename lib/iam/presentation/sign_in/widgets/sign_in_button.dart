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
            User user = new User(
                id: 'id',
                username: 'username',
                email: email,
                password: password,
                firstName: 'firstName',
                lastName: 'lastName',
                bio: 'bio',
                verified: false);

            IamApi iamApi = new IamApi();
            var data = await iamApi.login(user);
            var value_data = jsonDecode(data);
            final pref = await SharedPreferences.getInstance();
            pref.setString('token', value_data['tokens']['accessToken']);
            Navigator.pushNamed(context, '/create-publishing');
          } catch (e) {
            return ServerException()();
          }
        },
        icon: Icon(
          Icons.arrow_forward,
        )),
  );
}
