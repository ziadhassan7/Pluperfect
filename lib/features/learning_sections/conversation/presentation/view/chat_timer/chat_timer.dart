import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/cubit/timer_cubit.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/cubit/timer_state.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/timer_widget.dart';


class ChatTimer extends StatelessWidget {
  const ChatTimer({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerStates>(
        builder: (context, state) {

          //Started
          if(state is TimerStartState){
            return TimerWidget(color);
          }

          //Idle
          return const SizedBox.shrink();
        }
    );
  }
}
