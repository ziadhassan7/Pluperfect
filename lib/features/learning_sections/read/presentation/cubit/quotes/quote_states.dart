import 'package:equatable/equatable.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';

abstract class QuoteStates extends Equatable {
  const QuoteStates();
}

// Loading
class LoadingState extends QuoteStates {

  @override
  List<Object> get props => [];
}

// Response
class ResponseState extends QuoteStates {
  final String quote;

  const ResponseState(this.quote);

  @override
  List<Object> get props => [quote];
}

// Response
class ScoreState extends QuoteStates {
  final AzureModel result;
  final List<Words> words;

  const ScoreState(this.result, this.words);

  @override
  List<Object> get props => [result, words];
}
