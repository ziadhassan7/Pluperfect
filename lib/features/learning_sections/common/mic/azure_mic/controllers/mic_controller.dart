import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/mic/azure_mic/controllers/timeout_controller.dart';
import 'package:pluperfect/features/learning_sections/common/mic/azure_mic/controllers/timer_widget_controller.dart';
import '../../../../../../core/azure_speech/azure_model.dart';
import '../cubit/mic_cubit.dart';

class MicController {
  BuildContext context;
  Function(AzureModel) onResponse;
  String? referenceText;
  bool openTimer;
  late final TimeoutController timeoutController;

  MicController(this.context, this.onResponse, {this.referenceText, this.openTimer = false}){
    timeoutController = TimeoutController(context, onResponse, referenceText, openTimer,);
  }


  static bool timeoutButUserStillTouchesMic = false;


  startListening(){
    TimerWidgetController.showTimerWidgetIfAllowed(context, openTimer);

    context.read<MicCubit>().startListening();

    timeoutController.closeMicAfterTimeout();
  }

  finishListening(){

    if(!timeoutButUserStillTouchesMic){
      TimerWidgetController.hideTimerWidget(context, openTimer);

      context
          .read<MicCubit>()
          .finishedListening(context, onResponse, compareTo: referenceText);

      timeoutController.cancelTimeoutTrigger();
    }

    timeoutButUserStillTouchesMic = false;

  }




}