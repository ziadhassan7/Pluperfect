import 'package:equatable/equatable.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';

abstract class PracticeStates extends Equatable {
  const PracticeStates();
}

// Loading
class LoadingState extends PracticeStates {

  @override
  List<Object> get props => [];
}



// Response (Quote)
class QuoteState extends PracticeStates {
  final String quote;

  const QuoteState(this.quote);

  @override
  List<Object> get props => [quote];
}

// Response (Hear)
class HearState extends PracticeStates {
  final String quote;

  const HearState(this.quote);

  @override
  List<Object> get props => [quote];
}

// Response (Question)
class QuestionState extends PracticeStates {
  final String question;

  const QuestionState(this.question);

  @override
  List<Object> get props => [question];
}



// QuoteScore
class QuoteScoreState extends PracticeStates {
  final AzureModel result;
  final List<Words> words;

  const QuoteScoreState(this.result, this.words);

  @override
  List<Object> get props => [result, words];
}

