import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/loading_widget.dart';
import '../../../animation/listening_animation.dart';
import '../../mic_widget.dart';
import '../cubit/mic_cubit.dart';
import '../cubit/mic_states.dart';

class AzureMic extends StatelessWidget {
  const AzureMic({super.key, required this.color, required this.onResponse});

  final Color color;
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
              return LoadingWidget(color: color,);
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
