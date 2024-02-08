import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/mic/mic_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quotes_cubit.dart';
import '../cubit/mic/mic_states.dart';

class InteractionWidget extends StatelessWidget {
  const InteractionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onPanStart: (details){
        context.read<InteractionCubit>().listen();
      },
      onPanEnd: (details){
        context.read<InteractionCubit>().stop();
      },

      child: BlocBuilder<InteractionCubit, MicStates>(
        builder: (_, state){

          //Listening...
          if(state is ListeningState){
            return stopButton();
          }

          //Response
          if(state is IdleState){
            if(state.response != null) {
              context.read<QuotesCubit>().checkScore(state.response!);
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

  Widget idleButton(){
    return button("assets/speak.svg",);
  }

  Widget stopButton(){
    return button("assets/stop.svg",);
  }

  Widget button(String icon){
    return SvgPicture.asset(icon, height: 140, width: 140,);
  }
}
