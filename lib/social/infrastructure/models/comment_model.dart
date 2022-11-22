import 'package:easy_story_flutter/social/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      {required int id,
      required String content,
      required int userId,
      required bool edited,
      required String userName})
      : super(
          id: id,
          content: content,
          userId: userId,
          edited: edited,
          userName: userName,
        );
  factory CommentModel.fromJson(Map<dynamic, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json["content"],
      edited: json["edited"],
      userId: json['user']['id'],
      userName: json['user']["username"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "username": userName,
      "content": content,
      "edited": edited,
      'userId': userId,
    };
  }
}
