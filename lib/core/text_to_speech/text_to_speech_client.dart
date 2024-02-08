import 'package:flutter_tts/flutter_tts.dart';
import 'package:pluperfect/core/custom_log.dart';
import 'package:pluperfect/core/text_to_speech/tts_languages_model.dart';


class TTSClient {

  static FlutterTts flutterTts = FlutterTts();
  static bool isPlaying= false;

  // To Initialize: makes the app run faster in the future
  static init() async => await flutterTts.speak("");


  static Future speak(String text) async{

    String sourceLanguage = "en-US";

    // Check if language is available, and not (auto)
    if(sourceLanguage != "Auto Detect"){
      String langCode = TTSLanguageModel.getLangCode(sourceLanguage) ?? "en-US";

      if(await flutterTts.isLanguageAvailable(langCode)){
        flutterTts.setLanguage(langCode);
        Log("TTS", "available");
      } else {
        Log("TTS", "not available");
      }
    }

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