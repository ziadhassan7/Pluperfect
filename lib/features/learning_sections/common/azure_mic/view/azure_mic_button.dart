import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import '../cubit/mic_cubit.dart';
import '../cubit/mic_states.dart';

class AzureMicButton extends StatelessWidget {
  const AzureMicButton({super.key, required this.onResponse});

  final Function(AzureModel) onResponse;

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

          //Listening...
          if(state is ListeningState){
            return stopButton();
          }

          //Response
          if(state is IdleState){
            if(state.response != null){
              //trigger a score widget
              onResponse(state.response!);
            }
            return idleButton();
          }

          //Loading
          if(state is LoadingState){
            return const CircularProgressIndicator();
          }

          //Idle
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
    return Lottie.asset(icon, height: 120, width: 120, fit: BoxFit.fill, animate: shouldAnimate);
  }
}
