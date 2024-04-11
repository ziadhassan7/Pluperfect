import 'package:pluperfect/core/quotes/quotes_model.dart';
import '../../../../../core/quotes/quotes_client.dart';


class QuotesRepository {


  //English
  static Future<String?> getEnglishQuote(
      {required int minLength, required int maxLength,}) async {

    try{
      QuoteModel data = await QuotesClient.getQuote(minLength, maxLength);
      return data.quotes?.first.content;


    } catch (e){
      rethrow;
    }

  }

}