import 'package:equatable/equatable.dart';

abstract class QuestionStates extends Equatable {
  const QuestionStates();
}

// Loading
class LoadingState extends QuestionStates {

  @override
  List<Object> get props => [];
}


// Response
class ResponseState extends QuestionStates {
  final String question;

  const ResponseState(this.question);

  @override
  List<Object> get props => [question];
}
