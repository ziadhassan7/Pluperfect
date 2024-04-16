import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/azure_speech/azure_model.dart';
import '../cubit/mic_cubit.dart';
import 'mic_controller.dart';

class TimeoutController {
  BuildContext context;
  Function(AzureModel) onResponse;
  String? referenceText;
  bool openTimer;

  TimeoutController(this.context, this.onResponse, this.referenceText, this.openTimer);

  late Timer _micTimer;

  closeMicAfterTimeout(){
    _micTimer = Timer(const Duration(seconds: 30), () {
      print("Timer ran");
      context.read<MicCubit>().finishedListening(context, onResponse,
          compareTo: referenceText);

      MicController.timeoutButUserStillTouchesMic = true;
    });
  }

  cancelTimeoutTrigger(){
    _micTimer.cancel();
  }

}