import 'package:easy_story_flutter/iam/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String id,
      required String username,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String bio,
      required bool verified})
      : super(
            id: id,
            username: username,
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
            verified: verified);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      bio: json['bio'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'bio': bio,
      'verified': verified,
    };
  }
}
