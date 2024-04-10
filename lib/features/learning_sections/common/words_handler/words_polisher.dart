class WordsPolisher {

  static String? removeSymbolsFromText(String? text){
    return text?.replaceAll(RegExp(r"[^\w\s']+"), '');
  }
}