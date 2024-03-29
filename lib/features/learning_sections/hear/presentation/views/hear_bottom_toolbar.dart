import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_states.dart';
import '../../../../../core/constants/learning_sections.dart';
import '../../../../../core/file_util.dart';
import '../../../common/bottom_toolbar/bottom_toolbar.dart';
import '../../../common/congrats_dialog/congrats_dialog.dart';
import '../../../common/hear_user_input_controller.dart';
import '../../../common/quotes_provider/quotes_controller.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';
import '../cubit/hear/hear_cubit.dart';
import '../widgets/sentence_widget.dart';


class HearBottomToolbar extends StatelessWidget {
  const HearBottomToolbar(this.color, {super.key, required this.maximumSteps});

  final Color color;
  final int maximumSteps;

  static bool allowNextStep = false;

  shouldAllowGoingNextStep(BuildContext context){
    HearStates state = context.watch<HearCubit>().state;
    if(state is ScoreState){
      allowNextStep = true;
    } else {
      allowNextStep = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    shouldAllowGoingNextStep(context);

    return Container(
      padding: const CustomPadding(vertical: 0, horizontal: 38),
      decoration: BoxDecoration(
        color: ColorTheme.onBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),),

      child: Column(
        children: [

          const SentenceWidget(),


          BottomToolbar(
            color: color,

            //Mic
            micConfiguration: MicConfiguration(
                referenceText: QuotesController.currentQuote,
                onResponse: (userInput){
                  //trigger a score widget
                  context.read<HearCubit>().checkScore(userInput);
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
                        context.read<HearCubit>().refresh();
                      },
                      onStepsCompleted: (){
                        CongratsDialog(context, currentPage: LearningSections.hearPage,);
                      });

                } else{
                  context.read<HearCubit>().refresh();
                }
              },
            ),

          ),
        ],
      ),
    );
  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text,),
    );
  }

  Future<String> getAudioPath() async {
    String appPath = await FileUtil.getAppPath();
    String audioFilePath = '$appPath/audioFile.wav';

    return audioFilePath;
  }
}
