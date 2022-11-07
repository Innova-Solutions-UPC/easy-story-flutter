import 'package:easy_story_flutter/injections.dart';
import 'package:easy_story_flutter/publishing/application/publishing_service.dart';
import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';

class PublishingApi {
  final PublishingService publishingService =
      serviceLocator<PublishingService>();
  Future<List<WriteModel>> getPosts() async {
    return publishingService.getPosts();
  }

  Future<String> create_publishing(String title, String description,
      String content, String hashtags, String image, String status) async {
    return publishingService.create_publishing(
      title,
      description,
      content,
      hashtags,
      image,
      status,
    );
  }

  Future<String> edit_publishing(
    String title,
    String description,
    String content,
    String hashtags,
    String image,
    String status,
    String publishId,
  ) async {
    return publishingService.edit_publishing(
      title,
      description,
      content,
      hashtags,
      image,
      status,
      publishId,
    );
  }

  Future<dynamic> get_all_my_posts() async {
    return publishingService.get_all_my_posts();
  }

  Future<WriteModel> getAPost(
    String slug,
  ) {
    return publishingService.getAPost(
      slug,
    );
  }
}
