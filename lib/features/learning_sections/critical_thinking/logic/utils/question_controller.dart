import '../../../../../core/hive/shared_pref/languages_pref.dart';
import '../repository/question_repository.dart';

class QuestionController {

  static String? _currentQuote;

  static get currentQuote => _currentQuote;


  static Future<String?> getQuestion() async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        _currentQuote = await QuestionRepository.getEnglishQuestion();
      case LanguageCode.gr:
        _currentQuote = await QuestionRepository.getGermanQuestion();
      case LanguageCode.fr:
        _currentQuote = await QuestionRepository.getEnglishQuestion();
      case LanguageCode.it:
        _currentQuote = await QuestionRepository.getEnglishQuestion();
      case LanguageCode.ch:
        _currentQuote = await QuestionRepository.getEnglishQuestion();
    }

    return _currentQuote;
  }


}