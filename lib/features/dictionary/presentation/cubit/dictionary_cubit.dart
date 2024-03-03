import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/translate/translate_util.dart';
import '../../logic/data/repository/dictionary_repo.dart';
import 'dictionary_states.dart';


class DictionaryCubit extends Cubit<DictionaryStates>{
  DictionaryCubit() : super(const IdleState());

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

    _addWord(word);

    emit(IdleState(dataList: await DictionaryRepo.getData()));
  }


  _addWord(String word) async {
    DictionaryRepo.saveItem(
        word: word,
        translation: await TranslateUtil.translate(word)
    );
  }

}
