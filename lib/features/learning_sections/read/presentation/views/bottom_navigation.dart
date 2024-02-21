import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/audio/audio_client.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../core/custom_dialog/custom_dialog.dart';
import '../../../../../core/file_util.dart';
import '../../../common/mic/azure_mic/cubit/mic_cubit.dart';
import '../../../common/mic/azure_mic/cubit/mic_states.dart';
import '../../../common/mic/azure_mic/view/azure_mic.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quote_cubit.dart';
import '../dialogs/translation_dialog_view.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation(this.level, this.color, {super.key, required this.maximumSteps});

  final Level level;
  final Color color;
  final int maximumSteps;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late AudioClient audioClient;

  bool allowNextStep = false;
  //int currentStep = 0;

  @override
  void initState() {
    //set the audio file
    getAudioPath().then((file) {
      audioClient = AudioClient(filePath: file);
    });
    //reset current steps
    //currentStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MicStates state = context.watch<AzureMicCubit>().state;

    return Container(
      padding: const CustomPadding(vertical: 0, horizontal: 38),
      decoration: BoxDecoration(
        color: ColorTheme.onBackground,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
      ),),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          showWidget(
            isVisible: visibility(state),
            child: button(
              icon: 'assets/hear_button.svg',
              onPressed: ()=> audioClient.play(),
            ),
          ),

          Expanded(
            child: Center(child: AzureMic(
              color: widget.color,
              referenceText: QuotesController.currentQuote,
              onResponse: (userInput){
                //trigger a score widget
                context.read<QuoteCubit>().checkScore(userInput);
              },
            )),
          ),

          BlocListener<QuoteCubit, QuoteStates>(
            listener: (context, state){
              if(state is ScoreState){
                allowNextStep = true;
              } else {
                allowNextStep = false;
              }
            },
            child: button(
                icon: 'assets/next_button.svg',
                onPressed: () {
                  context.read<QuoteCubit>().refresh(widget.level);
                  if(allowNextStep){
                    //currentStep++;
                    context.read<StepsCubit>().nextStep(
                        context,
                        maximumSteps: 3,
                        onStepCompletedTrigger: CustomUhh(
                            context, view: const TranslationDialogView()));
                  }
                }
              )
          )
        ],
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

  Widget showWidget({required bool isVisible, required Widget child}){
    return isVisible
        ? child
        : const SizedBox(width: 28);
  }


  bool visibility(MicStates state){
    if(state is IdleState){
      return state.response != null;
    }

    return false;
  }
}
