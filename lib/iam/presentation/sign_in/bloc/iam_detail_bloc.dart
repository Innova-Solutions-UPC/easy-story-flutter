import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/iam/application/iam_service.dart';
import './bloc.dart';

class IamDetailBloc extends Bloc<IamDetailEvent, IamDetailState> {
  IamDetailBloc({required this.iamService}) : super(InitialIamDetailState());

  final IamService iamService;
  @override
  IamDetailState get initialState => InitialIamDetailState();

  @override
  Stream<IamDetailState> mapEventToState(
    IamDetailEvent event,
  ) async* {}
}
