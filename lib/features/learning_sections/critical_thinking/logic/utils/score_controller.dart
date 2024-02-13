import '../../../../../core/hive/shared_pref/languages_pref.dart';
import '../repository/grammar_repository.dart';


class ScoreController {

  static Future<String?> getGrammarEvaluation(String sentence) async {

    LanguageCode languageCode = LanguagePref.getLearningLanguage();

    switch(languageCode){
      case LanguageCode.en:
        return await GrammarRepository.getEnglishGrammar(sentence);
      case LanguageCode.gr:
        return await GrammarRepository.getGermanGrammar(sentence);
      case LanguageCode.fr:
        return await GrammarRepository.getFrenchGrammar(sentence);
      case LanguageCode.it:
        return await GrammarRepository.getItalianGrammar(sentence);
      case LanguageCode.ch:
        return await GrammarRepository.getChineseGrammar(sentence);
    }

  }


  static int getGrammarScore(String grammarEvaluation){

    try{

      // Find the index of "Grammar score: " and "/10"
      int startIndex =
          grammarEvaluation.indexOf("Grammar score: ") + "Grammar score: ".length;
      int endIndex = grammarEvaluation.indexOf("/10", startIndex);

      // Extract the substring containing the grammar score
      String scoreString = grammarEvaluation.substring(startIndex, endIndex);

      // Convert the score string to an integer
      int grammarScore = int.parse(scoreString);

      return grammarScore;

    } catch (e){
       return 0;
    }
  }

  static getCorrectStatement(String grammarEvaluation){

    // Split the phrase by the newline character (\n)
    List<String> lines = grammarEvaluation.split('\n');

    try{
      String correct = lines[0];
      return correct;

    } catch (e){
      return "";
    }
  }
}