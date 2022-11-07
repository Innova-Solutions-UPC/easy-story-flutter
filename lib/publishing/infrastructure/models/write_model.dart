import 'package:easy_story_flutter/publishing/domain/entities/publishing_post.dart';

class WriteModel extends PublishingPost {
  WriteModel({
    required int id,
    required String title,
    required String description,
    required String status,
    required String content,
    required String image,
    required String slug,
    required int authorId,
    required List<dynamic> hashtags,
  }) : super(
          id: id,
          title: title,
          description: description,
          status: status,
          content: content,
          image: image,
          hashtags: hashtags,
          slug: slug,
          authorId: authorId,
        );

  factory WriteModel.fromJson(Map<String, dynamic> json) {
    return WriteModel(
      id: json['id'],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      content: json["content"],
      image: json["image"],
      slug: json['slug'],
      authorId: json['author']['id'],
      hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
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
      "slug": slug,
      'author': authorId,
      "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
    };
  }
}
