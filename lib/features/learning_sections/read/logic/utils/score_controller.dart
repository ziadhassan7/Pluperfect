import '../../../../../../core/azure_speech/azure_model.dart';

class ScoreController {

  static List<Words> processSentence(List<Words> userWords, String quote){

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
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex - 1].word!))) {

        Words word = userInputWords[targetIndex - 1];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }

      if ((targetIndex < userInputWords.length) &&
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex].word!))) {

        Words word = userInputWords[targetIndex];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }

      if ((targetIndex < userInputWords.length - 1) &&
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex + 1].word!))) {

        Words word = userInputWords[targetIndex + 1];
        return Words(word: targetWord, accuracyScore: word.accuracyScore, errorType: word.errorType);
      }
    } catch (e){
      return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
    }

    return Words(word: targetWord, accuracyScore: 0.0, errorType: "");
  }



  static bool _compareIgnoreCase(String quoteWord, String userWord) {

    String processedQuoteWord = quoteWord.replaceAll(RegExp(r"[^\w\s']+"), '');

    return processedQuoteWord.toLowerCase() == userWord.toLowerCase();
  }


}





/*

/// Old Logic: (For comparing 2 sentences, input and quote)

static List processSentence(String quote, String userInput){

    print("userInput: $userInput");

    List quoteWords = _breakDownSentence(quote);
    List userInputWords = _breakDownSentence(userInput);

    List modifiedSentence = [];


    for(int i = 0; i < quoteWords.length; i++){

      try{
        modifiedSentence.add(_getMatchingWords(userInputWords, quoteWords[i], i));
      } catch (e) {
        continue;
      }
    }

    return modifiedSentence; //.join(' ') -> string
  }


  static String _getMatchingWords(List userInputWords, String targetWord, int targetIndex){
    try{
      if ((targetIndex > 0) &&
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex - 1]))) {
        return '/g/$targetWord/g/';
      }

      if ((targetIndex < userInputWords.length) &&
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex]))) {
        return '/g/$targetWord/g/';
      }

      if ((targetIndex < userInputWords.length - 1) &&
          (_compareIgnoreCase(targetWord, userInputWords[targetIndex + 1]))) {
        return '/g/$targetWord/g/';
      }

      return '/r/$targetWord/r/';

    } catch (e){
      return '/r/$targetWord/r/';
    }

  }


  static bool _compareIgnoreCase(String word1, String word2) {
    return word1.toLowerCase() == word2.toLowerCase();
  }

  static List _breakDownSentence(String sentence) {
    List polishedList = [];

    // Split the sentence into words, and handle contractions like "That's" -> "That is"
    List words = sentence.split(' ');
    List processedWords = [];

    for (String word in words) {
      if (word.toLowerCase() == "that's") {
        processedWords.add(word.substring(0, word.length - 2));
        processedWords.add("is");

      } else if (word.toLowerCase() == "it's") {
        processedWords.add(word.substring(0, word.length - 2));
        processedWords.add("is");

      } else if (word.toLowerCase() == "he's") {
        processedWords.add(word.substring(0, word.length - 2));
        processedWords.add("is");

      } else if (word.toLowerCase() == "she's") {
        processedWords.add(word.substring(0, word.length - 2));
        processedWords.add("is");

      } else if (word.toLowerCase() == "we're") {
        processedWords.add(word.substring(0, word.length - 3));
        processedWords.add("are");

      } else if (word.toLowerCase() == "they're") {
        processedWords.add(word.substring(0, word.length - 3));
        processedWords.add("are");

      } else if (word == "I'm") {
        processedWords.add(word.substring(0, word.length - 2));
        processedWords.add("am");

      } else if (word.endsWith("'ve")) {
        processedWords.add(word.substring(0, word.length - 3));
        processedWords.add("have");

      } else {
        processedWords.add(word);
      }
    }

    //remove punctuations
    for (String word in processedWords) {
      polishedList.add(word.replaceAll(RegExp(r'[^\w\s]+'), ''));
    }

    return polishedList;
  }
*/