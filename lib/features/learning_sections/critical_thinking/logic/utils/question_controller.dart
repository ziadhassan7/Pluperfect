import '../../../../../core/hive/shared_pref/languages_pref.dart';
import '../repository/question_repository.dart';

class QuestionController {

  static String? _currentQuestion;

  static get currentQuestion => _currentQuestion;


  static Future<String?> getQuestion() async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        _currentQuestion = await QuestionRepository.getEnglishQuestion();
      case LanguageCode.gr:
        _currentQuestion = await QuestionRepository.getGermanQuestion();
      case LanguageCode.fr:
        _currentQuestion = await QuestionRepository.getFrenchQuestion();
      case LanguageCode.it:
        _currentQuestion = await QuestionRepository.getItalianQuestion();
      case LanguageCode.ch:
        _currentQuestion = await QuestionRepository.getChineseQuestion();
    }

    return _currentQuestion;
  }

}