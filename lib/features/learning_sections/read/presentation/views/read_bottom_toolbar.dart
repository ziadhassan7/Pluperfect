import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/audio/audio_client.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/bottom_toolbar.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../core/custom_dialog/custom_dialog.dart';
import '../../../../../core/file_util.dart';
import '../../../common/congrats_dialog/congratulation_dialog.dart';
import '../../../common/congrats_dialog/learning_sections_buttons.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quote_cubit.dart';


class ReadBottomToolbar extends StatefulWidget {
  const ReadBottomToolbar(this.level, this.color, {super.key, required this.maximumSteps});

  final Level level;
  final Color color;
  final int maximumSteps;

  @override
  State<ReadBottomToolbar> createState() => _ReadBottomToolbarState();
}

class _ReadBottomToolbarState extends State<ReadBottomToolbar> {
  late AudioClient audioClient;
  bool allowNextStep = false;

  @override
  void initState() {
    //set the audio file
    getAudioPath().then((file) {
      audioClient = AudioClient(filePath: file);
    });
    super.initState();
  }

  shouldAllowGoingNextStep(){
    QuoteStates state = context.watch<QuoteCubit>().state;
    if(state is ScoreState){
      allowNextStep = true;
    } else {
      allowNextStep = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    shouldAllowGoingNextStep();

    return BottomToolbar(
      color: widget.color,

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
        onPressed: ()=> audioClient.play(),
      ),

      //next button
      nextButton: button(
        icon: 'assets/next_button.svg',
        onPressed: () {
          context.read<QuoteCubit>().refresh(widget.level);
          if(allowNextStep){
            context.read<StepsCubit>().nextStep(
                context,
                maximumSteps: widget.maximumSteps,
                onStepCompletedTrigger: (){
                  CustomDialog(context,
                      view: const CongratulationDialogView(currentPage: LearningSections.readPage,));
                });
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
