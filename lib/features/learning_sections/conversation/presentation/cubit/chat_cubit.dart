import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/custom_log.dart';
import '../../../../../../core/openai/openai_client.dart';
import '../../../../../../core/text_to_speech/text_to_speech_client.dart';
import '../../logic/utils/chat_input_controller.dart';
import 'package:pluperfect/core/record_audio/recorder_client.dart';
import 'chat_state.dart';


// Start State
// Open Speech (Trigger Event) -> Listen (Listen State) ->
// After listen -> send response (Show Loading State) ->
// Response (Response State)


class ChatCubit extends Cubit<ChatStates>{
  ChatCubit() : super(IdleState());


  /// Open
  // LoadingState
  // open gemini , "Let's Start" -> speak
  // ResponseState

  openInteraction() async {
    emit(LoadingState());

    _open();
  }

  _open() async {
    try{
      String? value = await ChatInputController.openChat();
      await _speak(value);
      emit(ResponseState(value));
    } catch (e){
      emit(ResponseState(e.toString()));
    }
  }


  /// Start Speaking
  // ListenState
  // Speech to text
  // send response
  // LoadingState
  // ResponseState

  startListening() async {
    //Listen
    RecorderClient.start();
    //emit listening state
    emit(ListenState());
  }


  stop(){

    emit(LoadingState());

    RecorderClient.stop().then((String? audioFilePath) async {
      if(audioFilePath != null){

        try {
          String result = await OpenAIClient.speechToText(audioFilePath);
          _send(result);

        } catch (e){
          emit(IdleState());
        }

      } else {
        emit(IdleState());
      }
    });

  }


  Future _send(String input) async {

    try{
      //Get Gemini response
      String? response = await ChatInputController.getChatAnswer(input);
      //emit response
      emit(ResponseState(response));
      //speak
      await _speak(response);

    } catch (e){
      Log("Chat Cubit", ResponseState(e.toString()));
    }
  }

  _speak(String? response) async {

    if(response != null) {
      await TTSClient.speak(response);
    }
  }

}
