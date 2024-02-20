import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_states.dart';


class StepsCubit extends Cubit<StepsState>{
  StepsCubit() : super(IdleState());

  String? quoteBody;

  refresh() {
    emit(RefreshState());
  }

  next() {
    emit(NextState());
  }

  nextStep(bool shouldGoNext) {

  }

}
