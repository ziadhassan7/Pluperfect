import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import '../../../common/mic/azure_mic/view/azure_mic.dart';
import '../../../common/steps_widget/cubit/steps_cubit.dart';
import '../cubit/chat_cubit.dart';


class ChatBottomToolbar extends StatelessWidget {
  const ChatBottomToolbar(this.color, {super.key, required this.maximumSteps});

  final Color color;
  final int maximumSteps;

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const CustomPadding(vertical: 0, horizontal: 38),
      decoration: BoxDecoration(
        color: ColorTheme.onBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),),

      child: Center(child: AzureMic(
        onResponse: (userInput) {
          //trigger a score widget
          context.read<ChatCubit>().sendInput(userInput);
          context.read<StepsCubit>().nextStep(
              context,
              maximumSteps: maximumSteps,
              onStepCompletedTrigger: 0
          );
        },
        color: color,),),

      /*child: Center(child: OpenaiMicButton(
        onResponse: (userInput) {
          //trigger a score widget
          context.read<ChatCubit>().sendInput(userInput);
        },
        color: ColorTheme.blue,),),*/
    );
  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text,),
    );
  }
}
