import 'package:equatable/equatable.dart';

abstract class SocialPostBlocState extends Equatable {
  const SocialPostBlocState();
}

class InitialSocialPostBlocState extends SocialPostBlocState {
  @override
  List<Object> get props => [];
}
