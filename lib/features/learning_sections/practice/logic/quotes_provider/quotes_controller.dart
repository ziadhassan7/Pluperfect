import 'package:pluperfect/features/learning_sections/practice/logic/quotes_provider/quotes_repository.dart';

class QuotesController {

  static String? _currentQuote;

  static String? get currentQuote => _currentQuote;


  //get a short quote from 0 to 50.
  static Future<String?> getShortQuote() async {

    const int min = 0;
    const int max = 50;

    try{
      _currentQuote = await QuotesRepository.getEnglishQuote(
          minLength: min, maxLength: max);

      return _currentQuote;

    } catch (e){
      rethrow;
    }
  }


  //get a short quote from 0 to 50.
  static Future<String?> getMediumQuote() async {

    const int min = 50;
    const int max = 120;

    try {
      _currentQuote = await QuotesRepository.getEnglishQuote(
          minLength: min, maxLength: max);

      return _currentQuote;

    } catch (e){
      rethrow;
    }
  }


  //get a short quote from 0 to 50.
  static Future<String?> getLongQuote() async {

    const int min = 120;
    const int max = 180;

    try {
      _currentQuote = await QuotesRepository.getEnglishQuote(
          minLength: min, maxLength: max);

      return _currentQuote;

    } catch (e){
      rethrow;
    }
  }


}