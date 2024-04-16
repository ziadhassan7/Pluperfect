import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/loading_widget.dart';
import 'package:pluperfect/features/learning_sections/common/mic/azure_mic/controllers/mic_controller.dart';
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


  @override
  Widget build(BuildContext context) {

    MicController micController = MicController(context, onResponse,
      referenceText: referenceText, openTimer: openTimer);

    return GestureDetector(
      onPanStart: (details){
        micController.startListening();
      },
      onPanEnd: (details){
        micController.finishListening();
      },

      child: BlocBuilder<MicCubit, MicStates>(
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
