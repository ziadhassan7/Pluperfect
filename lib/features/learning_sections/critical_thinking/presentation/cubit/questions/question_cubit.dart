import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/logic/utils/question_controller.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/question_states.dart';


class QuestionCubit extends Cubit<QuestionStates>{
  QuestionCubit() : super(LoadingState());

  String? quoteBody;

  refresh() async {

    emit(LoadingState());

    String? question = await QuestionController.getQuestion();

    if(question != null){
      emit(ResponseState(question));
    }

  }

}
