import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/cubit/timer_state.dart';


class TimerCubit extends Cubit<TimerStates>{

  TimerCubit() : super(IdleState());

  bool timerHasEnded = false;
  Duration duration = const Duration(seconds: 30);

  startTimer(){
    emit(TimerStartState());

    //turn off timer after 30 seconds
    Future.delayed(duration, ()=> reset());
  }

  reset() {
    emit(IdleState());
  }

}