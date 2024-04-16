import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../conversation/presentation/view/chat_timer/cubit/timer_cubit.dart';

class TimerWidgetController {

  static showTimerWidgetIfAllowed(BuildContext context, bool shouldOpenTimerWidget){
    if(shouldOpenTimerWidget){
      context.read<TimerCubit>().startTimer();
    }
  }

  static hideTimerWidget(BuildContext context, bool shouldOpenTimerWidget){
    if(shouldOpenTimerWidget){
      context.read<TimerCubit>().reset();
    }
  }

}