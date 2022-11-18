import 'package:equatable/equatable.dart';

abstract class SocialBookmarkDetailState extends Equatable {
  const SocialBookmarkDetailState();
}

class InitialSocialBookmarkDetailState extends SocialBookmarkDetailState {
  @override
  List<Object> get props => [];
}
