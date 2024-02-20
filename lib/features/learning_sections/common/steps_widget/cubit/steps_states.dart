import 'package:equatable/equatable.dart';

abstract class StepsState extends Equatable {
  const StepsState();
}

// Idle
class IdleState extends StepsState {

  @override
  List<Object> get props => [];
}

// Refresh
class RefreshState extends StepsState {

  @override
  List<Object> get props => [];
}

// Next
class NextState extends StepsState {

  @override
  List<Object> get props => [];
}

