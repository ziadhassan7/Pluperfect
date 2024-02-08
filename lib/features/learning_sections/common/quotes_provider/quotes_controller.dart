import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_repository.dart';
import '../../../../core/hive/shared_pref/languages_pref.dart';

class QuotesController {

  static String? _currentQuote;

  static get currentQuote => _currentQuote;


  //get a short quote from 0 to 50.
  static Future<String?> getShortQuote() async {

    const int min = 0;
    const int max = 50;

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.gr:
        _currentQuote = await QuotesRepository.getGermanQuote(minLength: min, maxLength: max);
      case LanguageCode.fr:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.it:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.ch:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
    }

    return _currentQuote;
  }


  //get a short quote from 0 to 50.
  static Future<String?> getMediumQuote() async {

    const int min = 50;
    const int max = 120;

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.gr:
        _currentQuote = await QuotesRepository.getGermanQuote(minLength: min, maxLength: max);
      case LanguageCode.fr:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.it:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.ch:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
    }

    return _currentQuote;
  }


  //get a short quote from 0 to 50.
  static Future<String?> getLongQuote() async {

    const int min = 120;
    const int max = 180;

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.gr:
        _currentQuote = await QuotesRepository.getGermanQuote(minLength: min, maxLength: max);
      case LanguageCode.fr:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.it:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
      case LanguageCode.ch:
        _currentQuote = await QuotesRepository.getEnglishQuote(minLength: min, maxLength: max);
    }

    return _currentQuote;
  }


}