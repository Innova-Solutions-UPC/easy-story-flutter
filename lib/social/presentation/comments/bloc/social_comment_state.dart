import 'package:equatable/equatable.dart';

abstract class SocialCommentDetailState extends Equatable {
  const SocialCommentDetailState();
}

class InitialSocialCommentDetailState extends SocialCommentDetailState {
  @override
  List<Object> get props => [];
}
