import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/hive/shared_pref/languages_pref.dart';
import 'package:pluperfect/features/dictionary/logic/local_db/dictionary_client.dart';
import '../../logic/model/dictionary_model.dart';


class DictionaryCubit extends Cubit<bool>{
  DictionaryCubit() : super(false);

  static final DictionaryClient _dicClient = DictionaryClient.instance;


  refreshBookmarkState(String word) async {

    if(await _isExist(word)) emit(true);

    emit(false);
  }

  toggle(String word, String translation){
    emit(!state);

    if(state){
      _save(word, translation);
    } else {
      _delete(word);
    }
  }


  _save(String word, String translation) async {
    DictionaryModel model = DictionaryModel(
      id: word,
      translation: translation,
      languageLocal: LanguagePref.getLearningLanguage().name,
    );

    if(await _isExist(word)){
      _dicClient.updateItem(model);
    } else {
      _dicClient.createItem(model);
    }

    emit(true);
  }

  _delete(String word) {
    _dicClient.deleteItem(word);
    emit(false);
  }

  static Future<bool> _isExist(String word) async {
    List<DictionaryModel> all = await _dicClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == word) return true;
    }

    return false;
  }



}
