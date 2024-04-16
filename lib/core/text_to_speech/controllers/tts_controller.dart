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
    await flutterTts.setSpeechRate(1.0);

    await flutterTts.setPitch(1.0);

    await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
  }


}