import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/logic/utils/question_controller.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/logic/utils/score_controller.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/critical_states.dart';


class CriticalThinkingCubit extends Cubit<CriticalThinkingStates>{
  CriticalThinkingCubit() : super(LoadingState());

  String? quoteBody;

  getQuestion() async {

    emit(LoadingState());

    String? question = await QuestionController.getQuestion();

    if(question != null){
      emit(ResponseState(question));
    }

  }

  getScore(AzureModel userInput) async {
    String? input = userInput.displayText;
    double? pronunciationScore = userInput.nBest?.first.pronScore;

    if(input != null){
      String? grammarEvaluation = await ScoreController.getGrammarEvaluation(input);

      if(grammarEvaluation != null
          && pronunciationScore != null){

        String correctStatement = ScoreController.getCorrectStatement(grammarEvaluation);
        int grammarScore = ScoreController.getGrammarScore(grammarEvaluation);

        emit(ScoreState(input, correctStatement, grammarScore, pronunciationScore));
      }


    }
  }

}
