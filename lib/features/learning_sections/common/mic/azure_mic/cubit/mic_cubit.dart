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

  bool shouldSend = false;

  static late Timer timer;


  startListening(){

    emit(ListeningState());

    //start mic after some delay
    timer = Timer(const Duration(milliseconds: 500), (){

      shouldSend = true;
      RecorderClient.start();

    });
  }

  finishedListening(BuildContext context, Function(AzureModel) onResponse, {String? compareTo})  async {

    timer.cancel();

    if(shouldSend) {
      stopMicAndSend(onResponse, compareTo: compareTo);
    } else {
      discard(context);
    }

    shouldSend = false;
  }

  discard(BuildContext context){
    RecorderClient.stop();
    emit(const WarningState());

    ContextMenu.show(context,);
    Future.delayed(const Duration(milliseconds: 500,), ()=> ContextMenu.close());
  }

  stopMicAndSend(Function(AzureModel) onResponse, {String? compareTo}){
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