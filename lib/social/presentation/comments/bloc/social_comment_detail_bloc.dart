import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';

import './bloc.dart';
import 'social_comment_detail_event.dart';
import 'social_comment_state.dart';

class SocialCommentDetailBloc
    extends Bloc<SocialCommentDetailEvent, SocialCommentDetailState> {
  SocialCommentDetailBloc({required this.socialService})
      : super(InitialSocialCommentDetailState());

  final SocialService socialService;
  @override
  SocialCommentDetailState get initialState =>
      InitialSocialCommentDetailState();

  @override
  Stream<SocialCommentDetailState> mapEventToState(
    SocialCommentDetailEvent event,
  ) async* {}
}
