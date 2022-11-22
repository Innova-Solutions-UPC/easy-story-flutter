import 'package:equatable/equatable.dart';

class Post extends Equatable {
  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.content,
    required this.image,
    required this.hashtags,
    required this.slug,
    required this.authorId,
  });

  final int id;
  final String title;
  final String description;
  final String status;
  final String content;
  final String image;
  final String slug;
  final int authorId;
  final List<dynamic> hashtags;
  @override
  List<dynamic> get props => <dynamic>[
        id,
        title,
        description,
        status,
        content,
        image,
        hashtags,
      ];
}
