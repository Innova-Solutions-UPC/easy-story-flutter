import 'package:equatable/equatable.dart';

class WritePost extends Equatable {
  WritePost({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.content,
    required this.image,
    required this.hashtags,
  });

  final String id;
  final String title;
  final String description;
  final String status;
  final String content;
  final String image;
  final List<String> hashtags;

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
