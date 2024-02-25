import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/bottom_toolbar/bottom_toolbar.dart';
import 'package:pluperfect/features/learning_sections/common/hear_user_input_controller.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../core/custom_dialog/custom_dialog.dart';
import '../../../../../core/file_util.dart';
import '../../../common/congrats_dialog/congratulation_dialog.dart';
import '../../../common/congrats_dialog/learning_sections_buttons.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quote_cubit.dart';


class ReadBottomToolbar extends StatelessWidget {
  const ReadBottomToolbar(this.level, this.color, {super.key, required this.maximumSteps});

  final Level level;
  final Color color;
  final int maximumSteps;

  static bool allowNextStep = false;


  shouldAllowGoingNextStep(BuildContext context){
    QuoteStates state = context.watch<QuoteCubit>().state;
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
          referenceText: QuotesController.currentQuote,
          onResponse: (userInput){
            //trigger a score widget
            context.read<QuoteCubit>().checkScore(userInput);
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
                    context.read<QuoteCubit>().refresh(level);
                  },
                  onStepsCompleted: (){
                    CustomDialog(context, dismissible: false,
                        view: const CongratulationDialogView(currentPage: LearningSections.readPage,));
                  });

            } else {
              context.read<QuoteCubit>().refresh(level);
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
