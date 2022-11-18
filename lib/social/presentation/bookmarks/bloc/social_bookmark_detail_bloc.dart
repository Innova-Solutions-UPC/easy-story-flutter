import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/iam/application/iam_service.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';
import 'package:easy_story_flutter/social/presentation/bookmarks/bloc/social_bookmark_detail_event.dart';
import 'package:easy_story_flutter/social/presentation/bookmarks/bloc/social_bookmark_state.dart';
import './bloc.dart';

class SocialBookmarkDetailBloc
    extends Bloc<SocialBookmarkDetailEvent, SocialBookmarkDetailState> {
  SocialBookmarkDetailBloc({required this.socialService})
      : super(InitialSocialBookmarkDetailState());

  final SocialService socialService;
  @override
  SocialBookmarkDetailState get initialState =>
      InitialSocialBookmarkDetailState();

  @override
  Stream<SocialBookmarkDetailState> mapEventToState(
    SocialBookmarkDetailEvent event,
  ) async* {}
}
