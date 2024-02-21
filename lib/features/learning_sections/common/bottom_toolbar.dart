import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import '../../../core/styles/color_theme.dart';
import '../../../core/styles/padding.dart';
import 'mic/azure_mic/cubit/mic_cubit.dart';
import 'mic/azure_mic/cubit/mic_states.dart';
import 'mic/azure_mic/view/azure_mic.dart';

///Mic Configuration
class MicConfiguration{
  MicConfiguration({required this.onResponse, this.referenceText,});

  final Function(AzureModel) onResponse;
  final String? referenceText;
}


///Bottom Toolbar
class BottomToolbar extends StatelessWidget {
  const BottomToolbar(
      {super.key,
        required this.color,
        required this.micConfiguration,
        this.leftButton, this.nextButton,});

  final MicConfiguration micConfiguration;
  final Color color;

  final Widget? leftButton;
  final Widget? nextButton;


  @override
  Widget build(BuildContext context) {
    MicStates state = context.watch<AzureMicCubit>().state;

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
            child: Center(child: AzureMic(
              color: color,
              referenceText: micConfiguration.referenceText,
              onResponse: micConfiguration.onResponse,
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

  bool visibility(MicStates state){
    if(state is IdleState){
      return state.response != null;
    }

    return false;
  }
}
