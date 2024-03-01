import '../../../../core/constants/db_constants/dictionary_db_constanst.dart';

class DictionaryModel {

  final String id;
  final String translation;
  final String languageLocal;

  DictionaryModel({
    required this.id,
    required this.translation,
    required this.languageLocal,
  });


  // Take only the changed value,
  // and assign the rest to the same data
  DictionaryModel copyWith({
    String? id,
    String? translation,
    String? languageLocal,
  }){
    return DictionaryModel(
        id: id ?? this.id,
        translation: translation ?? this.translation,
        languageLocal: languageLocal ?? this.languageLocal,
    );
  }


  // Assign map to model variables
  factory DictionaryModel.fromMap(Map<String, dynamic> map) {
    return DictionaryModel(
      id: map[columnDicId],
      translation: map[columnTranslation],
      languageLocal: map[columnLanguageLocal],
    );
  }

  // Get map from model
  Map<String, dynamic> toMap() {
    return {
      columnDicId: id,
      columnTranslation: translation,
      columnLanguageLocal: languageLocal,
    };
  }
}