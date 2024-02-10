import 'package:equatable/equatable.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';

abstract class HearStates extends Equatable {
  const HearStates();
}

// Loading
class LoadingState extends HearStates {

  @override
  List<Object> get props => [];
}

// Speaking
class SpeakingState extends HearStates {
  final String response;

  const SpeakingState(this.response);

  @override
  List<Object> get props => [response];
}

// Idle (Waiting for user to speak)
class IdleState extends HearStates {
  const IdleState();

  @override
  List<Object> get props => [];
}

// Score
class ScoreState extends HearStates {
  final AzureModel result;

  const ScoreState(this.result);

  @override
  List<Object> get props => [result];
}
