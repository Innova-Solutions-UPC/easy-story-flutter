import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  Profile({
    required this.id,
    required this.username,
    required this.email,
    required this.imageProfile,
  });

  final int id;
  final String username;
  final String email;
  final String imageProfile;

  @override
  List<dynamic> get props => <dynamic>[
        id,
        username,
        email,
        imageProfile,
      ];
}
