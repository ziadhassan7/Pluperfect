import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/audio/audio_client.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../../../core/file_util.dart';
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


    return Padding(
      padding: const CustomPadding(vertical: 26),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          button(
            icon: 'assets/hear_button.svg',
            onPressed: ()=> audioClient.play(),
          ),

          button(
            icon: 'assets/next_button.svg',
            onPressed: ()=> context.read<QuotesCubit>().refresh(widget.level),
          )
        ],
      ),
    );
  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon),
    );
  }

  Future<String> getAudioPath() async {
    String appPath = await FileUtil.getAppPath();
    String audioFilePath = '$appPath/audioFile.wav';

    return audioFilePath;
  }
}
