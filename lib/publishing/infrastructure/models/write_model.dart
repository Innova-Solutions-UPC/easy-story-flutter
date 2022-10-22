import 'package:easy_story_flutter/publishing/domain/entities/publishing_post.dart';

class WriteModel extends PublishingPost {
  WriteModel({
    required String id,
    required String title,
    required String description,
    required String status,
    required String content,
    required String image,
    required List<String> hashtags,
  }) : super(
          id: id,
          title: title,
          description: description,
          status: status,
          content: content,
          image: image,
          hashtags: hashtags,
        );

  factory WriteModel.fromJson(Map<String, dynamic> json) {
    return WriteModel(
      id: json['id'],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      content: json["content"],
      image: json["image"],
      hashtags: List<String>.from(json["hashtags"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      "description": description,
      "status": status,
      "content": content,
      "image": image,
      "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
    };
  }
}
