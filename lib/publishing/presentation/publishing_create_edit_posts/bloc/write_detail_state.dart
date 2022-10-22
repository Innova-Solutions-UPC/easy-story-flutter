import 'package:equatable/equatable.dart';

abstract class WriteDetailState extends Equatable {
  const WriteDetailState();
}

class InitialWriteDetailState extends WriteDetailState {
  @override
  List<Object> get props => [];
}
