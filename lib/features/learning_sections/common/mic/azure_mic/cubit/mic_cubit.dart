import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/record_audio/recorder_client.dart';
import '../../../../../../../core/azure_speech/azure_speech.dart';
import '../../../../practice/presentation/views/pop_up_mic_warning/pop_up_warning.dart';
import 'mic_states.dart';


class AzureMicCubit extends Cubit<MicStates>{

  AzureMicCubit() : super(const IdleState());

  bool notMissPressed = false;

  static late Timer timer;


  startListening(){

    emit(ListeningState());

    _startMicIfNotMissPressed();
  }

  finishedListening(BuildContext context, Function(AzureModel) onResponse, {String? compareTo})  async {

    timer.cancel();

    if(notMissPressed) {
      _stopMicAndSend(onResponse, compareTo: compareTo);
    } else {
      _discard(context);
    }

    notMissPressed = false;
  }

  forceStopOnChatTimer(Function(AzureModel) onResponse){
    _stopMicAndSend(onResponse);
  }


  void _startMicIfNotMissPressed(){
    //start mic after some delay
    timer = Timer(const Duration(milliseconds: 500), (){

      notMissPressed = true;
      RecorderClient.start();

    });
  }

  void _discard(BuildContext context){
    RecorderClient.stop();
    emit(const WarningState());

    _showMissPressWarning(context);
  }

  void _showMissPressWarning(BuildContext context){
    PopUpWarning.show(context);
    Future.delayed(const Duration(milliseconds: 500,), ()=> PopUpWarning.close());
  }

  void _stopMicAndSend(Function(AzureModel) onResponse, {String? compareTo}){
    emit(LoadingState());

    RecorderClient.stop().then((String? audioFilePath) async {
      if(audioFilePath != null){

        try {
          AzureModel result = await AzureSpeech.getTranscription(
              audioFile: File(audioFilePath),
              referenceText: compareTo);
          emit(IdleState(response: result));

          //Trigger an event
          onResponse(result);

        } catch (e){
          emit(const IdleState());
        }

      } else {
        emit(const IdleState());
      }
    });
  }

}