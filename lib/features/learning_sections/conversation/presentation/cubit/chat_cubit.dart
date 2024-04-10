import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import '../../../../../../core/custom_log.dart';
import '../../../../../../core/text_to_speech/text_to_speech_client.dart';
import '../../../common/words_handler/words_polisher.dart';
import '../../logic/utils/chat_input_controller.dart';
import 'chat_state.dart';


class ChatCubit extends Cubit<ChatStates>{
  ChatCubit() : super(IdleState());


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



  sendInput(AzureModel userInput) async {

    String? input = userInput.displayText;

    emit(LoadingState());

    try{
      if(input != null){
        //Get Gemini response
        String? response = await ChatInputController.getChatAnswer(input);
        String? processedResponse = WordsPolisher.removeSymbolsFromText(response);
        //speak
        await _speak(processedResponse);
        //on Speak Complete , emit response
        TTSClient.onComplete(() => emit(ResponseState(processedResponse)));

      } else {
        Log("Chat Cubit", const ResponseState("Didn't hear what you said?!"));
      }
    } catch (e){
      Log("Chat Cubit", ResponseState(e.toString()));
    }
  }

  _speak(String? response) async {

    if(response != null) {
      await TTSClient.speak(response);
      emit(SpeakState());
    }
  }

}
