import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/cubit/timer_state.dart';


class TimerCubit extends Cubit<TimerStates>{

  TimerCubit() : super(IdleState());

  bool timerHasEnded = false;

  startTimer(){
    emit(TimerStartState());

  }

  reset() {
    emit(IdleState());
  }

}