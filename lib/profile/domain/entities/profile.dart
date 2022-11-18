import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  Profile({
    required this.id,
    required this.username,
    required this.email,
  });

  final int id;
  final String username;
  final String email;

  @override
  List<dynamic> get props => <dynamic>[
        id,
        username,
        email,
      ];
}
