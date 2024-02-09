import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import '../../../common/azure_mic/cubit/mic_cubit.dart';
import '../../../common/azure_mic/cubit/mic_states.dart';


class MicButton extends StatelessWidget {
  const MicButton({super.key});

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
            return stopButton();
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

  Widget stopButton(){
    return button('assets/stop_2.svg');
  }

  Widget idleButton(){
    return button('assets/speak_2.svg');
  }

  Widget button(String icon){
    return SvgPicture.asset(icon);
  }
}
