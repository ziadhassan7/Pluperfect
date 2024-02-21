import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_states.dart';


class StepsCubit extends Cubit<StepsState>{
  StepsCubit() : super(const NextState(0));

  int currentStep = 0;

  nextStep(BuildContext context, {required int maximumSteps, Object? onStepCompletedTrigger}) {
    if(currentStep < maximumSteps){
      currentStep++;
      emit(NextState(currentStep));

    } else {
      onStepCompletedTrigger;
    }
  }

  reset(){
    currentStep=0;
    emit(const NextState(0));
  }

}
