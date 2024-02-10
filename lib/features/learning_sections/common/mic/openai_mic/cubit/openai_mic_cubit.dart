import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/core/record_audio/recorder_client.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import '../../../../../../../core/azure_speech/azure_speech.dart';
import '../../../../../../core/openai/openai_client.dart';
import 'mic_states.dart';



class OpenaiMicCubit extends Cubit<MicStates>{

  OpenaiMicCubit() : super(const IdleState());

  listen(){
    RecorderClient.start();
    emit(ListeningState());
  }

  stop()  async {

    emit(LoadingState());

    RecorderClient.stop().then((String? audioFilePath) async {
      if(audioFilePath != null){

        try {
          String result = await OpenAIClient.speechToText(audioFilePath);
          /*AzureModel result = await AzureSpeech.getTranscription(
              audioFile: File(audioFilePath),
              referenceText: QuotesController.currentQuote);*/
          emit(IdleState(response: result));

        } catch (e){
          emit(const IdleState());
        }

      } else {
        emit(const IdleState());
      }
    });
  }

}