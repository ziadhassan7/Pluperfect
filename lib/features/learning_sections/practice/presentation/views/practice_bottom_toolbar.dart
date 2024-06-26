import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/practice/logic/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_cubit.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_states.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/screens/practice_page.dart';
import 'package:pluperfect/features/learning_sections/common/bottom_toolbar/bottom_toolbar.dart';
import 'package:pluperfect/features/learning_sections/practice/logic/utils/hear_user_input_controller.dart';
import '../../../../../core/constants/learning_sections.dart';
import '../../../../../core/file_util.dart';
import '../../../common/congrats_dialog/congrats_dialog.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';


class PracticeBottomToolbar extends StatelessWidget {
  const PracticeBottomToolbar(this.color, {super.key, required this.maximumSteps});

  final Color color;
  final int maximumSteps;

  static bool allowNextStep = false;


  shouldAllowGoingNextStep(PracticeStates state){
    if(state is ScoreState){
      allowNextStep = true;
    } else {
      allowNextStep = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    PracticeStates state = context.watch<PracticeCubit>().state;

    shouldAllowGoingNextStep(state);

    return BottomToolbar(
      color: color,

      //Mic
      micConfiguration: MicConfiguration(
          referenceText: QuotesController.currentQuote,
          onResponse: (userInput){
            //trigger a score widget
            context.read<PracticeCubit>().checkScore(userInput, section: PracticePage.section);
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
                    context.read<PracticeCubit>().refresh(section: PracticePage.section);
                  },
                  onStepsCompleted: (){
                    CongratsDialog(context, currentPage: LearningSections.practicePage,);
                  });

            } else {
              context.read<PracticeCubit>().refresh(section: PracticePage.section);
            }
          }
      ),

    );
  }

  Widget button({required String icon, required Function()? onPressed}){
    return InkWell(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text, width: 28,),
    );
  }

  Future<String> getAudioPath() async {
    String appPath = await FileUtil.getAppPath();
    String audioFilePath = '$appPath/audioFile.wav';

    return audioFilePath;
  }
}
