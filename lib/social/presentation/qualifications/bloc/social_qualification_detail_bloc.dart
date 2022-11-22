import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:easy_story_flutter/social/application/social_service.dart';

import './bloc.dart';

class SocialQualificationDetailBloc extends Bloc<SocialQualificationDetailEvent,
    SocialQualificationDetailState> {
  SocialQualificationDetailBloc({required this.socialService})
      : super(InitialSocialQualificationDetailState());

  final SocialService socialService;
  @override
  SocialQualificationDetailState get initialState =>
      InitialSocialQualificationDetailState();

  @override
  Stream<SocialQualificationDetailState> mapEventToState(
    SocialQualificationDetailEvent event,
  ) async* {}
}
