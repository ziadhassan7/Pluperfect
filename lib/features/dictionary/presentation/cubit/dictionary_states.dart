import 'package:equatable/equatable.dart';

import '../../logic/model/dictionary_model.dart';

abstract class DictionaryStates extends Equatable {
  const DictionaryStates();
}

// Loading
class LoadingState extends DictionaryStates {

  @override
  List<Object> get props => [];
}

// Idle (Waiting for user to speak)
class IdleState extends DictionaryStates {
  const IdleState({this.dataList});

  final List<DictionaryModel>? dataList;

  @override
  List<Object?> get props => [dataList];
}
