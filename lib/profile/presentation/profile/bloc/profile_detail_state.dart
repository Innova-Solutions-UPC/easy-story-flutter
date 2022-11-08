import 'package:equatable/equatable.dart';

abstract class ProfileDetailState extends Equatable {
  const ProfileDetailState();
}

class InitialProfileDetailState extends ProfileDetailState {
  @override
  List<Object> get props => [];
}
