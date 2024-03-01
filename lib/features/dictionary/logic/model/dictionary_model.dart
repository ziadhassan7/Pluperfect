import '../../../../core/constants/db_constants/dictionary_db_constanst.dart';

class DictionaryModel {

  final String id;
  final String word;
  final String translation;
  final String languageLocal;

  DictionaryModel({
    required this.id,
    required this.word,
    required this.translation,
    required this.languageLocal,
  });


  // Take only the changed value,
  // and assign the rest to the same data
  DictionaryModel copyWith({
    String? id,
    String? word,
    String? translation,
    String? languageLocal,
  }){
    return DictionaryModel(
        id: id ?? this.id,
        word: word ?? this.word,
        translation: translation ?? this.translation,
        languageLocal: languageLocal ?? this.languageLocal,
    );
  }


  // Assign map to model variables
  factory DictionaryModel.fromMap(Map<String, dynamic> map) {
    return DictionaryModel(
      id: map[columnDicId],
      word: map[columnWord],
      translation: map[columnTranslation],
      languageLocal: map[columnLanguageLocal],
    );
  }

  // Get map from model
  Map<String, dynamic> toMap() {
    return {
      columnDicId: id,
      columnWord: word,
      columnTranslation: translation,
      columnLanguageLocal: languageLocal,
    };
  }
}