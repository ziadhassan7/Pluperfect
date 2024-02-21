import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import '../../../common/bottom_toolbar.dart';
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
        onResponse: (userInput) {
          //trigger a score widget
          context.read<ChatCubit>().sendInput(userInput);
          context.read<StepsCubit>().nextStep(
            context,
            maximumSteps: maximumSteps,
          );
        },
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
