import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/record_audio/recorder_client.dart';
import '../../../../../../../core/azure_speech/azure_speech.dart';
import 'mic_states.dart';


class AzureMicCubit extends Cubit<MicStates>{

  AzureMicCubit() : super(const IdleState());

  listen(){
    RecorderClient.start();
    emit(ListeningState());
  }

  stop(Function(AzureModel) onResponse, {String? compareTo})  async {

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