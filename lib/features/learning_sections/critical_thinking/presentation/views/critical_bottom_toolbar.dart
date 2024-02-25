import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/congrats_dialog/learning_sections_buttons.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_cubit.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_states.dart';
import '../../../common/bottom_toolbar/bottom_toolbar.dart';
import '../../../common/congrats_dialog/congrats_dialog.dart';
import '../../../common/hear_user_input_controller.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';


class CriticalBottomToolbar extends StatelessWidget {
  const CriticalBottomToolbar(this.color, {super.key, required this.maximumSteps});

  final Color color;
  final int maximumSteps;

  static bool allowNextStep = false;

  shouldAllowGoingNextStep(BuildContext context){
    CriticalThinkingStates state = context.watch<CriticalThinkingCubit>().state;
    if(state is ScoreState){
      allowNextStep = true;
    } else {
      allowNextStep = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    shouldAllowGoingNextStep(context);

    return BottomToolbar(
      color: color,

      //Mic
      micConfiguration: MicConfiguration(
          onResponse: (userInput){
            //trigger a score widget
            context.read<CriticalThinkingCubit>().getScore(userInput);
          }
      ),

        //left button
        // (hear your voice)
        leftButton: button(
          icon: 'assets/hear_button.svg',
          onPressed: ()=> HearUserInputController.play(),
        ),

      //next button
      nextButton: button(
          icon: 'assets/next_button.svg',
          onPressed: () {

            if(allowNextStep){

              context.read<StepsCubit>().nextStep(
                  context,
                  maximumSteps: maximumSteps,
                  onStep: (){
                    context.read<CriticalThinkingCubit>().getQuestion();
                  },
                  onStepsCompleted: (){
                    CongratsDialog(context, currentPage: LearningSections.criticalPage,);
                  });

              } else {
                context.read<CriticalThinkingCubit>().getQuestion();
              }
            }
        )
    );

  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text,),
    );
  }

}
