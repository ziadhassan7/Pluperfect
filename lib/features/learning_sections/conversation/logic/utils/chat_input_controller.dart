import 'package:pluperfect/core/constants/ai_requests.dart';
import 'package:pluperfect/core/hive/shared_pref/languages_pref.dart';
import 'package:pluperfect/core/openai/openai_client.dart';
import '../../../../../../../core/gemini/gemini_client.dart';

class ChatInputController {


  static Future<String?> openChat() async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){

    //Use gemini for English
      case LanguageCode.en:
        return GeminiClient.openChat(ChatOpener.english);

    //Use openAi for other languages
      case LanguageCode.gr:
        return OpenAIClient.openChat(ChatOpener.germany);
      case LanguageCode.fr:
        return OpenAIClient.openChat(ChatOpener.frensh);
      case LanguageCode.it:
        return OpenAIClient.openChat(ChatOpener.italian);
      case LanguageCode.ch:
        return OpenAIClient.openChat(ChatOpener.chinese);
    }
  }


  static Future<String?> getChatAnswer(String input) async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
    //Use gemini for English
      case LanguageCode.en:
        return await GeminiClient.chat(input);

    //Use openAi for other languages
      case LanguageCode.gr:
        return await OpenAIClient.chat(input);
      case LanguageCode.fr:
        return await OpenAIClient.chat(input);
      case LanguageCode.it:
        return await OpenAIClient.chat(input);
      case LanguageCode.ch:
        return await OpenAIClient.chat(input);
    }
  }

}