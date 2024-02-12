import 'package:equatable/equatable.dart';

abstract class ChatStates extends Equatable {
  const ChatStates();
}

// Idle
class IdleState extends ChatStates {

  @override
  List<Object> get props => [];
}

// Speak
class SpeakState extends ChatStates {

  @override
  List<Object> get props => [];
}

// Loading
class LoadingState extends ChatStates {

  @override
  List<Object> get props => [];
}

// Response
class ResponseState extends ChatStates {
  final String? input;

  const ResponseState(this.input);

  @override
  List<Object> get props => [];
}
