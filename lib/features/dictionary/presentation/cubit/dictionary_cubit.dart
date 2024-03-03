import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/translate/translate_util.dart';
import '../../logic/data/repository/dictionary_repo.dart';
import '../../logic/model/dictionary_model.dart';
import 'dictionary_states.dart';


class DictionaryCubit extends Cubit<DictionaryStates>{
  DictionaryCubit() : super(const IdleState());

  ///Refresh current List
  refresh() async {
    emit(LoadingState());

    emit(IdleState(dataList: await DictionaryRepo.getData()));
  }

  ///Delete
  delete(String word) async {
    emit(LoadingState());

    DictionaryRepo.deleteItem(word);

    emit(IdleState(dataList: await DictionaryRepo.getData()));
  }

  ///Add
  saveWord(String word) async {

    emit(LoadingState());

    await _addWord(word);

    emit(IdleState(dataList: await DictionaryRepo.getData()));
  }


  _addWord(String word) async {
    if(!await _isExist(word)){
      DictionaryRepo.saveItem(
          word: word,
          translation: await TranslateUtil.translate(word)
      );
    }
  }

  static Future<bool> _isExist(String word) async {
    List<DictionaryModel> all = await DictionaryRepo.getData();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == word) return true;
    }

    return false;
  }

}
