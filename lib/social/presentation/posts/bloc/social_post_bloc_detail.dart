import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';
import './bloc.dart';

class SocialPostBlocDetail
    extends Bloc<SocialPostBlocEvent, SocialPostBlocState> {
  SocialPostBlocDetail({required this.socialService})
      : super(InitialSocialPostBlocState());

  final SocialService socialService;
  @override
  SocialPostBlocState get initialState => InitialSocialPostBlocState();

  @override
  Stream<SocialPostBlocState> mapEventToState(
    SocialPostBlocEvent event,
  ) async* {}
}
