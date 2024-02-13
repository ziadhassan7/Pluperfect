import 'package:equatable/equatable.dart';

abstract class CriticalThinkingStates extends Equatable {
  const CriticalThinkingStates();
}

// Loading
class LoadingState extends CriticalThinkingStates {

  @override
  List<Object> get props => [];
}


// Response
class ResponseState extends CriticalThinkingStates {
  final String question;

  const ResponseState(this.question);

  @override
  List<Object> get props => [question];
}


// Response
class ScoreState extends CriticalThinkingStates {
  final String userInput;
  final String correct;
  final String feedback;
  final int grammarScore;
  final double pronScore;

  const ScoreState(this.userInput, this.correct, this.feedback, this.grammarScore, this.pronScore);

  @override
  List<Object> get props => [userInput, correct, feedback, grammarScore, pronScore];
}
