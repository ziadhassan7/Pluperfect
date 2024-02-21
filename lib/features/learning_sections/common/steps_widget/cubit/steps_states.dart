import 'package:equatable/equatable.dart';

abstract class StepsState extends Equatable {
  const StepsState();
}

// Next
class NextState extends StepsState {

  final int currentStep;

  const NextState(this.currentStep);

  @override
  List<Object> get props => [currentStep];
}

