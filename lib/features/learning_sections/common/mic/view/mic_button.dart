import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import '../cubit/mic_cubit.dart';
import '../cubit/mic_states.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details){
        context.read<MicCubit>().listen();
      },
      onPanEnd: (details){
        context.read<MicCubit>().stop();
      },

      child: BlocBuilder<MicCubit, MicStates>(
        builder: (context, state) {

          if(state is ListeningState){
            return stopButton();
          }

          if(state is IdleState){
            if(state.response != null){
              //trigger a score widget
              context.read<HearCubit>().score();
            }
            return idleButton();
          }

          return idleButton();
        }
      ),
    );
  }

  Widget stopButton(){
    return button('assets/animations/mic.json', true);
    //Lottie.asset('assets/animations/blue.json'),
    //Lottie.asset('assets/animations/blue_good.json'),
    //Lottie.asset('assets/animations/cortona.json'),
    //Lottie.asset('assets/animations/mic.json'),
  }

  Widget idleButton(){
    return button('assets/animations/mic.json', false);
  }

  Widget button(String icon, bool shouldAnimate){
    return Lottie.asset(icon, height: 250, width: 250, fit: BoxFit.fill, animate: shouldAnimate);
  }
}
