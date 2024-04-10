import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_repository.dart';
import '../../../../core/hive/shared_pref/languages_pref.dart';

class QuotesController {

  static String? _currentQuote;

  static String? get currentQuote => _currentQuote;


  //get a short quote from 0 to 50.
  static Future<String?> getShortQuote() async {

    const int min = 0;
    const int max = 50;

    _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);

    return _currentQuote;
  }


  //get a short quote from 0 to 50.
  static Future<String?> getMediumQuote() async {

    const int min = 50;
    const int max = 120;

    _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);

    return _currentQuote;
  }


  //get a short quote from 0 to 50.
  static Future<String?> getLongQuote() async {

    const int min = 120;
    const int max = 180;

    _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);

    return _currentQuote;
  }


}