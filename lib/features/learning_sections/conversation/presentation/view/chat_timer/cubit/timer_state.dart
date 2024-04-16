import 'package:equatable/equatable.dart';

abstract class TimerStates extends Equatable {
  const TimerStates();
}

// Idle
class IdleState extends TimerStates {

  @override
  List<Object> get props => [];
}

// Timer is Counting
class TimerStartState extends TimerStates {

  @override
  List<Object> get props => [];
}
