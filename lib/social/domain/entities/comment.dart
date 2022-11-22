import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  Comment({
    required this.id,
    required this.content,
    required this.userId,
    required this.edited,
    required this.userName,
  });

  final int id;

  final String content;
  final String userName;
  final int userId;
  final bool edited;
  @override
  List<dynamic> get props => <dynamic>[
        id,
        content,
        userId,
        edited,
      ];
}
