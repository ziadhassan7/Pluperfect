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



// QuoteScore
class ScoreState extends PracticeStates {
  final AzureModel result;
  final List<Words> words;

  const ScoreState(this.result, this.words);

  @override
  List<Object> get props => [result, words];
}



// Loading
class ErrorState extends PracticeStates {

  @override
  List<Object> get props => [];
}

