import 'package:pluperfect/core/constants/ai_requests.dart';
import 'package:pluperfect/core/hive/shared_pref/languages_pref.dart';
import '../../../../../../../core/gemini/gemini_client.dart';

class ChatInputController {


  static Future<String?> openChat() async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    return GeminiClient.openChat(ChatOpener.english);
  }


  static Future<String?> getChatAnswer(String input) async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    return await GeminiClient.chat(input);
  }

}