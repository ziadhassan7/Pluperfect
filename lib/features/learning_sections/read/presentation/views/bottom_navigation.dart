import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/audio/audio_client.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../../../core/file_util.dart';
import '../../../common/mic/azure_mic/cubit/mic_cubit.dart';
import '../../../common/mic/azure_mic/cubit/mic_states.dart';
import '../../../common/mic/azure_mic/view/azure_mic.dart';
import '../../logic/utils/level_controller.dart';
import '../cubit/quotes/quotes_cubit.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation(this.level, {super.key});

  final Level level;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late AudioClient audioClient;

  @override
  void initState() {
    getAudioPath().then((file) {
      audioClient = AudioClient(filePath: file);
    });
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

          Visibility(
            visible: visibility(state),
            child: button(
              icon: 'assets/hear_button.svg',
              onPressed: ()=> audioClient.play(),
            ),
          ),

          Center(child: AzureMic(
            color: ColorTheme.violet,
            onResponse: (userInput){
              //trigger a score widget
              context.read<QuotesCubit>().checkScore(userInput);
            }
          )),

          Visibility(
            visible: visibility(state),
            child: button(
              icon: 'assets/next_button.svg',
              onPressed: ()=> context.read<QuotesCubit>().refresh(widget.level),
            ),
          )
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


  bool visibility(MicStates state){
    if(state is IdleState){
      return state.response != null;
    }

    return false;
  }
}
