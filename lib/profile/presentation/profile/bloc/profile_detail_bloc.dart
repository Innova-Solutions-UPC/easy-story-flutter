import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/profile/application/profile_service.dart';
import './bloc.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc({required this.profileService})
      : super(InitialProfileDetailState());

  final ProfileService profileService;
  @override
  ProfileDetailState get initialState => InitialProfileDetailState();

  @override
  Stream<ProfileDetailState> mapEventToState(
    ProfileDetailEvent event,
  ) async* {}
}
