import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_cubit.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_states.dart';
import '../../../../../core/custom_dialog/custom_dialog.dart';
import '../../../common/bottom_toolbar.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';
import '../../../read/presentation/dialogs/translation_dialog_view.dart';


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

    return BottomToolbar(
      color: color,

      //Mic
      micConfiguration: MicConfiguration(
          onResponse: (userInput){
            //trigger a score widget
            context.read<CriticalThinkingCubit>().getScore(userInput);
          }
      ),

      //next button
      nextButton: button(
          icon: 'assets/next_button.svg',
          onPressed: () {
            context.read<CriticalThinkingCubit>().getQuestion();
            if(allowNextStep){
              context.read<StepsCubit>().nextStep(
                  context,
                  maximumSteps: maximumSteps,
                  onStepCompletedTrigger: (){
                    CustomUhh(context, view: const TranslationDialogView());
                  });
            }
          }
      ),

    );

  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text,),
    );
  }

}
