import 'package:easy_story_flutter/publishing/infrastructure/models/write_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublishingListState extends Equatable {}

class InitialPublishingListState extends PublishingListState {
  InitialPublishingListState();

  @override
  List<Object?> get props => [];
}
