import 'package:pluperfect/features/learning_sections/common/words_handler/words_comparison.dart';
import '../../../../../core/azure_speech/azure_model.dart';

class CorrectWordsProcessor {

  //Get a list words with its score
  static List<Words> getScoredWords(List<Words> userWords, String quote){

    List<Words> modifiedSentence = [];
    List quoteWords = quote.split(' ');


    for(int i = 0; i < quoteWords.length; i++){

      try{
        modifiedSentence.add(_compareSpokenWordWithQuote(userWords, quoteWords[i], i));

      } catch (e) {
        continue;
      }
    }

    return modifiedSentence;
  }

  //Compares each word (from the quote),
  //to the equivalent word of the user's spoken text
  // (compares each word to the three words in front of it)
  // (compare SpokenWord With Quote)
  static Words _compareSpokenWordWithQuote(List<Words> userInputWords, String targetWord, int targetIndex){

    try{

      if (_theWordBeforeMatched(userInputWords, targetWord, targetIndex)) {

        Words wordThatMatched = userInputWords[targetIndex - 1];
        return Words(word: targetWord, accuracyScore: wordThatMatched.accuracyScore, errorType: wordThatMatched.errorType);
      }

      if (_theWordMatched(userInputWords, targetWord, targetIndex)) {

        Words wordThatMatched = userInputWords[targetIndex];
        return Words(word: targetWord, accuracyScore: wordThatMatched.accuracyScore, errorType: wordThatMatched.errorType);
      }

      if (_theWordAfterMatched(userInputWords, targetWord, targetIndex)) {

        Words wordThatMatched = userInputWords[targetIndex + 1];
        return Words(word: targetWord, accuracyScore: wordThatMatched.accuracyScore, errorType: wordThatMatched.errorType);
      }

    //Not Matched: get the word with a score of 0
    } catch (e){
      return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
    }
    return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
  }



  static bool _theWordBeforeMatched(List<Words> userInputWords, String targetWord, int targetIndex,){

    bool isTargetWordNotFirstWord = (targetIndex > 0); //cuz first word doesn't have a word before
    bool wordBeforeMatched = (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex - 1].word!));

    return isTargetWordNotFirstWord && wordBeforeMatched;
  }

  static bool _theWordMatched(List<Words> userInputWords, String targetWord, int targetIndex,){

    bool inBoundsOfArray = (targetIndex < userInputWords.length);
    bool wordMatched = (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex].word!));

    return inBoundsOfArray && wordMatched;
  }

  static bool _theWordAfterMatched(List<Words> userInputWords, String targetWord, int targetIndex,){

    bool isTargetWordNotLastWord = (targetIndex < userInputWords.length - 1);
    bool wordAfterMatched = (WordsComparison.compareIgnoreCase(targetWord, userInputWords[targetIndex + 1].word!));

    return isTargetWordNotLastWord && wordAfterMatched;
  }

}
