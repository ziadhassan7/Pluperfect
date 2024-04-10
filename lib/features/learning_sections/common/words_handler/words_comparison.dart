import 'package:pluperfect/features/learning_sections/common/words_handler/words_polisher.dart';

class WordsComparison{

  static bool compareIgnoreCase(String quoteWord, String userWord) {

    String processedQuoteWord = WordsPolisher.removeSymbolsFromText(quoteWord)!;

    return processedQuoteWord.toLowerCase() == userWord.toLowerCase();
  }

}