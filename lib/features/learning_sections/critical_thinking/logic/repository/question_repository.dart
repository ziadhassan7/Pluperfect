import 'package:pluperfect/core/constants/ai_requests.dart';
import 'package:pluperfect/core/gemini/gemini_client.dart';
import 'package:pluperfect/core/openai/openai_client.dart';


class QuestionRepository {


  //English
  static Future<String?> getEnglishQuestion() async {

    return await GeminiClient.textOnly(CriticalThinkingRequest.english);
  }


  //German
  static Future<String?> getGermanQuestion() async {

    return await OpenAIClient.getNormalResponse(CriticalThinkingRequest.germany);
  }

  //French
  static Future<String?> getFrenchQuestion() async {

    return await OpenAIClient.getNormalResponse(CriticalThinkingRequest.frensh);
  }

  //Italian
  static Future<String?> getItalianQuestion() async {

    return await OpenAIClient.getNormalResponse(CriticalThinkingRequest.italian);
  }

  //Chinese
  static Future<String?> getChineseQuestion() async {

    return await OpenAIClient.getNormalResponse(CriticalThinkingRequest.chinese);
  }

}