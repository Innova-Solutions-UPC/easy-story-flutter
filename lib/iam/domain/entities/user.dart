import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.verified,
  });

  final String id;
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String bio;
  final bool verified;

  @override
  List<dynamic> get props => <dynamic>[
        id,
        username,
        email,
        password,
        firstName,
        lastName,
        bio,
        verified
      ];
}
