import '../../../../../core/constants/ai_requests.dart';
import '../../../../../core/openai/openai_client.dart';

class GrammarRepository {

  //English
  static Future<String?> getEnglishGrammar(String sentence) async {

    return await OpenAIClient.getSystemTask(GrammarEvaluationRequest.english, sentence);
  }


  //German
  static Future<String?> getGermanGrammar(String sentence) async {

    return await OpenAIClient.getSystemTask(GrammarEvaluationRequest.germany, sentence);
  }

  //French
  static Future<String?> getFrenchGrammar(String sentence) async {

    return await OpenAIClient.getSystemTask(GrammarEvaluationRequest.frensh, sentence);
  }

  //Italian
  static Future<String?> getItalianGrammar(String sentence) async {

    return await OpenAIClient.getSystemTask(GrammarEvaluationRequest.italian, sentence);
  }

  //Chinese
  static Future<String?> getChineseGrammar(String sentence) async {

    return await OpenAIClient.getSystemTask(GrammarEvaluationRequest.chinese, sentence);
  }

}