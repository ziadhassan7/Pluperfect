import 'package:equatable/equatable.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';

abstract class MicStates extends Equatable {
  const MicStates();
}

// Idle
class IdleState extends MicStates {
  final AzureModel? response;

  const IdleState({this.response});

  @override
  List<Object?> get props => [response];
}

// Listing
class ListeningState extends MicStates {

  @override
  List<Object> get props => [];
}

// Loading
class LoadingState extends MicStates {

  @override
  List<Object> get props => [];
}

// Warning
class WarningState extends MicStates {
  static const String userMicPressWarning = "Hold to record";
  final String? warning;

  const WarningState({this.warning = userMicPressWarning});

  @override
  List<Object> get props => [];
}
