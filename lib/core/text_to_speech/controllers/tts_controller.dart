import 'package:flutter_tts/flutter_tts.dart';
import '../../custom_log.dart';
import '../language_model/tts_languages_model.dart';

class TtsController {

  static setupLanguage(FlutterTts flutterTts) async {
    String sourceLanguage = "en-US";

    // Check if language is available, and not (auto)
    if (sourceLanguage != "Auto Detect") {
      String langCode = TTSLanguageModel.getLangCode(sourceLanguage) ?? "en-US";

      if (await flutterTts.isLanguageAvailable(langCode)) {
        flutterTts.setLanguage(langCode);
        Log("TTS", "available");
      } else {
        Log("TTS", "not available");
      }
    }
  }

  static setupVoiceTone(FlutterTts flutterTts) async {

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setPitch(0.9);

    await flutterTts.setVoice({"name": "en-gb-x-gbb-network", "locale": "en-GB"});
    //{"name": "en-us-x-tpf-local", "locale": "en-US"} //1
    //{"name": "en-gb-x-gbb-network", "locale": "en-GB"} //0.9
    //{"name": "en-au-x-aub-network", "locale": "en-AU"} //0.8
  }


}