import '../../../../../../../core/custom_log.dart';
import '../../../../../../../core/text_to_speech/text_to_speech_client.dart';

class SpeakerController {

  static Future speak(String? text) async {
    if(text != null){
      return await TTSClient.speak(text);

    } else {
      // todo: Show a toast message
      Log("TTS Controller", "Quote is empty");
    }

    return Future(()=> null);
  }

  static Future stop() async {
    return await TTSClient.stop();
  }


  static onComplete(Function() trigger){
    TTSClient.onComplete(trigger);
  }

}