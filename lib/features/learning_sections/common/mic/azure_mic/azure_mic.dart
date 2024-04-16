import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/loading_widget.dart';
import 'package:pluperfect/features/learning_sections/conversation/presentation/view/chat_timer/cubit/timer_cubit.dart';
import '../../animation/listening_animation.dart';
import 'widget/mic_widget.dart';
import 'cubit/mic_cubit.dart';
import 'cubit/mic_states.dart';

class AzureMic extends StatelessWidget {
  const AzureMic({super.key, required this.color, required this.onResponse, this.referenceText, this.openTimer = false});

  final Color color;
  final Function(AzureModel) onResponse;
  final String? referenceText;

  final bool openTimer;

  static bool _timerEnded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details){
        if(!_timerEnded) {
          context.read<AzureMicCubit>().startListening();
          if(openTimer){
            context.read<TimerCubit>().startTimer();
            Timer(const Duration(seconds: 30), (){
              context.read<AzureMicCubit>().forceStopOnChatTimer(onResponse);
              _timerEnded = true;
            });
          }
        }
      },
      onPanEnd: (details){
        context.read<AzureMicCubit>().finishedListening(context, onResponse, compareTo: referenceText);
        if(openTimer) context.read<TimerCubit>().reset();
        _timerEnded = false;
      },

      child: BlocBuilder<AzureMicCubit, MicStates>(
          builder: (context, state) {

            //Listening...
            if(state is ListeningState){
              return stopButton();
            }

            //Loading
            if(state is LoadingState){
              return LoadingWidget(color: color,);
            }

            //Warning
            if(state is WarningState){
              return idleButton();
            }

            //Idle
            return idleButton();
          }
      ),
    );
  }

  Widget stopButton(){
    return ListeningAnimation(color: color);
  }

  Widget idleButton(){
    return Padding(
      padding: const CustomPadding.all(28),
      child: MicWidget(color: color,),
    );
  }

}
