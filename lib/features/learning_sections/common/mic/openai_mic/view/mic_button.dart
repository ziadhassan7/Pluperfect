import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/mic/openai_mic/cubit/openai_mic_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/mic/openai_mic/cubit/openai_mic_states.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../animation/listening_animation.dart';
import '../../../loading_widget.dart';
import '../../mic_widget.dart';


class OpenaiMicButton extends StatelessWidget {
  const OpenaiMicButton({super.key, required this.onResponse, required this.color});

  final Color color;
  final Function(String) onResponse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details){
        context.read<OpenaiMicCubit>().listen();
      },
      onPanEnd: (details){
        context.read<OpenaiMicCubit>().stop();
      },

      child: BlocBuilder<OpenaiMicCubit, OpenaiMicStates>(
        builder: (context, state) {

          //Listening...
          if(state is ListeningState){
            return listenButton();
          }

          //Response
          if(state is IdleState){
            if(state.response != null){
              //trigger on response
              onResponse(state.response!);
            }
            return idleButton();
          }

          //Loading
          if(state is LoadingState){
            return LoadingWidget(color: color,);
          }

          //Idle
          return idleButton();
        }
      ),
    );
  }

  Widget listenButton(){
    return ListeningAnimation(color: color);
  }

  Widget idleButton(){
    return Padding(
      padding: const CustomPadding.all(28),
      child: MicWidget(color: color),
    );
  }

}
