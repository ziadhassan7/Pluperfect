import 'package:flutter_tts/flutter_tts.dart';
import 'package:pluperfect/core/text_to_speech/controllers/tts_controller.dart';


class TTSClient {

  static FlutterTts flutterTts = FlutterTts();
  static bool isPlaying= false;

  // To Initialize: makes the app run faster in the future
  static init() async => await flutterTts.speak("");


  static Future speak(String text) async{

    TtsController.setupLanguage(flutterTts);
    TtsController.setupVoiceTone(flutterTts);

    return await flutterTts.speak(text);
  }

  static Future stop() async{
    isPlaying = false;
    return await flutterTts.stop();
  }


  static onComplete(Function() onComplete){
    isPlaying = false;
    flutterTts.setCompletionHandler(onComplete);
  }

}