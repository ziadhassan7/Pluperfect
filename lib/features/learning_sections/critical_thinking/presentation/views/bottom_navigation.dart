import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_cubit.dart';
import '../../../common/mic/azure_mic/cubit/mic_states.dart';
import '../../../common/mic/azure_mic/view/azure_mic.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});


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

      child: Center(
          child: AzureMic(
              color: ColorTheme.red,
              onResponse: (userInput){
                //trigger a score widget
                context.read<CriticalThinkingCubit>().getScore(userInput);
              }
          )),
    );
  }

  Widget button({required String icon, required Function()? onPressed}){
    return GestureDetector(
      onTap: onPressed,

      child: SvgPicture.asset(icon, color: ColorTheme.text,),
    );
  }


  bool visibility(MicStates state){
    if(state is IdleState){
      return state.response != null;
    }

    return false;
  }
}
