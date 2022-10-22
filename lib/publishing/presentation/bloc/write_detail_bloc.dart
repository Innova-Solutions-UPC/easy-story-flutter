import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_story_flutter/publishing/application/write_service.dart';
import './write_bloc.dart';

class WriteDetailBloc extends Bloc<WriteDetailEvent, WriteDetailState> {
  WriteDetailBloc({required this.writeService})
      : super(InitialWriteDetailState());

  final WriteService writeService;

  @override
  WriteDetailState get initialState => InitialWriteDetailState();

  @override
  Stream<WriteDetailState> mapEventToState(
    WriteDetailState event,
  ) async* {}
}
