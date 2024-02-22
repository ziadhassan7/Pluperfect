import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_states.dart';


class StepsCubit extends Cubit<StepsState>{
  StepsCubit() : super(const NextState(1));

  int currentStep = 1;

  nextStep(BuildContext context, {required int maximumSteps, required Function() onStep, Function()? onStepsCompleted}) {

    if(currentStep < maximumSteps){

      onStep(); //function on each step
      stepForward(); //increase a step

    } else {
      runFunctionIfExists(onStepsCompleted); //when all steps complete
    }
  }

  reset(){
    currentStep=1;
    emit(const NextState(1));
  }

  stepForward(){
    currentStep++;
    emit(NextState(currentStep));
  }

  runFunctionIfExists(Function()? function){
    if(function != null){
      function();
    }
  }


}
