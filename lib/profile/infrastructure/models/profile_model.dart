import 'package:easy_story_flutter/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required int id,
    required String username,
    required String email,
    required String imageProfile,
  }) : super(
          id: id,
          username: username,
          email: email,
          imageProfile: imageProfile,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        imageProfile: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
