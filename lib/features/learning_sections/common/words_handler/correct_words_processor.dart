import 'package:pluperfect/features/learning_sections/common/words_handler/words_comparison.dart';
import '../../../../../core/azure_speech/azure_model.dart';

class CorrectWordsProcessor {


  static List<Words> getModifiedWords(List<Words> userWords, String quote){

    List<Words> modifiedSentence = [];
    List quoteWords = quote.split(' ');


    for(int i = 0; i < quoteWords.length; i++){

      try{
        modifiedSentence.add(_getMatchingWords(userWords, quoteWords[i], i));

      } catch (e) {
        continue;
      }
    }

    return modifiedSentence;
  }


  static Words _getMatchingWords(List<Words> userInputWords, String targetWord, int targetIndex){

    try{
      if ((targetIndex > 0) &&
          (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex - 1].word!))) {

        Words word = userInputWords[targetIndex - 1];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }

      if ((targetIndex < userInputWords.length) &&
          (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex].word!))) {

        Words word = userInputWords[targetIndex];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }

      if ((targetIndex < userInputWords.length - 1) &&
          (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex + 1].word!))) {

        Words word = userInputWords[targetIndex + 1];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }
    } catch (e){
      return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
    }

    return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
  }





}
