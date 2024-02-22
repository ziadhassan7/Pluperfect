import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/mic/openai_mic/cubit/openai_mic_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/mic/openai_mic/cubit/openai_mic_states.dart';
import '../../../../../core/styles/color_theme.dart';
import '../../../../../core/styles/padding.dart';
import '../mic/openai_mic/view/mic_button.dart';


///Bottom Toolbar
class BottomToolbarWithOpenAi extends StatelessWidget {
  const BottomToolbarWithOpenAi(
      {super.key,
        required this.color,
        required this.onResponse,
        this.leftButton, this.nextButton,});

  final Function(String) onResponse;
  final Color color;

  final Widget? leftButton;
  final Widget? nextButton;


  @override
  Widget build(BuildContext context) {
    OpenaiMicStates state = context.watch<OpenaiMicCubit>().state;

    //decoration
    return Container(
      padding: const CustomPadding(vertical: 0, horizontal: 38),
      decoration: BoxDecoration(
        color: ColorTheme.onBackground,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),),


      // leftButton , Mic, NextButton
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          showWidget(
            isVisible: visibility(state),
            child: leftButton,
          ),

          Expanded(
            child: Center(child: OpenaiMicButton(
              color: color,
              onResponse: onResponse,
            )),
          ),

          nextButton ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget showWidget({required bool isVisible, required Widget? child}){

    return isVisible && child != null
        ? child
        : const SizedBox(width: 28);
  }

  bool visibility(OpenaiMicStates state){
    if(state is IdleState){
      return state.response != null;
    }

    return false;
  }
}
