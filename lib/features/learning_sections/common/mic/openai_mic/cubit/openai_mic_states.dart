import 'package:equatable/equatable.dart';

abstract class OpenaiMicStates extends Equatable {
  const OpenaiMicStates();
}

// Idle
class IdleState extends OpenaiMicStates {
  final String? response;

  const IdleState({this.response});

  @override
  List<Object?> get props => [response];
}

// Listing
class ListeningState extends OpenaiMicStates {

  @override
  List<Object> get props => [];
}

// Loading
class LoadingState extends OpenaiMicStates {

  @override
  List<Object> get props => [];
}
