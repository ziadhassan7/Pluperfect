import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/learning_sections.dart';
import '../../../common/bottom_toolbar/bottom_toolbar.dart';
import '../../../common/congrats_dialog/congrats_dialog.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';
import '../cubit/chat_cubit.dart';


class ChatBottomToolbar extends StatelessWidget {
  const ChatBottomToolbar(this.color, {super.key, required this.maximumSteps});

  final Color color;
  final int maximumSteps;

  @override
  Widget build(BuildContext context) {

    return BottomToolbar(
      color: color,

      //Mic
      micConfiguration: MicConfiguration(
        openTimer: true,
        onResponse: (userInput) {
          //trigger a score widget
          context.read<StepsCubit>().nextStep(
            context,
            maximumSteps: maximumSteps,
            onStep: (){
              context.read<ChatCubit>().sendInput(userInput);
            },
            onStepsCompleted: (){
              CongratsDialog(context, currentPage: LearningSections.chatPage,);
            },
          );
        },
      ),

    );
  }

}
