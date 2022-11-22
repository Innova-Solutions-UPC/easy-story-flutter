import 'package:easy_story_flutter/social/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required int id,
      required String title,
      required String description,
      required String status,
      required String content,
      required String image,
      required List hashtags,
      required String slug,
      required int authorId,
      required String authorName})
      : super(
          id: id,
          title: title,
          description: description,
          status: status,
          content: content,
          image: image,
          hashtags: hashtags,
          slug: slug,
          authorId: authorId,
          authorName: authorName,
        );
  factory PostModel.fromJson(Map<dynamic, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      content: json["content"],
      image: json["image"],
      slug: json['slug'],
      authorId: json['author']['id'],
      authorName: json['author']['username'],
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
