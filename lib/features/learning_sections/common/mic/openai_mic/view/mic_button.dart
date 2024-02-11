import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import '../../../animation/listening_animation.dart';
import '../../../mic/azure_mic/cubit/mic_cubit.dart';
import '../../../mic/azure_mic/cubit/mic_states.dart';
import '../../mic_widget.dart';


class OpenaiMicButton extends StatelessWidget {
  const OpenaiMicButton({super.key, required this.onResponse, required this.color});

  final Color color;
  final Function(String) onResponse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details){
        context.read<AzureMicCubit>().listen();
      },
      onPanEnd: (details){
        context.read<AzureMicCubit>().stop();
      },

      child: BlocBuilder<AzureMicCubit, MicStates>(
        builder: (context, state) {

          if(state is ListeningState){
            return listenButton();
          }

          if(state is IdleState){
            if(state.response != null){
              //trigger a score widget
              context.read<HearCubit>().score(state.response!);
            }
            return idleButton();
          }

          return idleButton();
        }
      ),
    );
  }

  Widget listenButton(){
    return ListeningAnimation(color: color);
  }

  Widget idleButton(){
    return MicWidget(color: color);
  }

  Widget button(String icon){
    return SvgPicture.asset(icon);
  }
}
