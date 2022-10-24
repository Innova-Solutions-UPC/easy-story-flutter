import 'package:easy_story_flutter/publishing/application/publishing_service.dart';
import './publishing_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublishingListBlocDetail
    extends Bloc<PublishingListBlocEvent, PublishingListState> {
  final PublishingService publishingService;
  String posts;
  PublishingListBlocDetail(this.posts, {required this.publishingService})
      : super(InitialPublishingListState());

  @override
  PublishingListState get initialState => InitialPublishingListState();

  @override
  Stream<PublishingListState> mapEventToState(
    PublishingListState event,
  ) async* {
    posts = await publishingService.get_all_my_posts();
  }
}
