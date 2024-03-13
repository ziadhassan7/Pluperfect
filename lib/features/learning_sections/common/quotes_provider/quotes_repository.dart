import 'package:pluperfect/core/constants/ai_requests.dart';
import 'package:pluperfect/core/gemini/gemini_client.dart';


class QuotesRepository {


  //English
  static Future<String?> getEnglishQuote(
      {required int minLength, required int maxLength,}) async {

    return await GeminiClient.textOnly(
        QuoteRequest.getEnglish(minLength, maxLength));
  }


  //German
  static Future<String?> getGermanQuote(
      {required int minLength, required int maxLength,}) async {

    return await GeminiClient.textOnly(
        QuoteRequest.getGermany(minLength, maxLength));
  }

  //French
  static Future<String?> getFrenchQuote(
      {required int minLength, required int maxLength,}) async {

    return await GeminiClient.textOnly(
        QuoteRequest.getFrench(minLength, maxLength));
  }

  //Italian
  static Future<String?> getItalianQuote(
      {required int minLength, required int maxLength,}) async {

    return await GeminiClient.textOnly(
        QuoteRequest.getItalian(minLength, maxLength));
  }

  //Chinese
  static Future<String?> getChineseQuote(
      {required int minLength, required int maxLength,}) async {

    return await GeminiClient.textOnly(
        QuoteRequest.getChinese(minLength, maxLength));
  }

}