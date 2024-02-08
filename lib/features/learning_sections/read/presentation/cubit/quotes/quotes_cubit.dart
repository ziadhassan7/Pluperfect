import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/read/logic/utils/score_controller.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/quotes/quote_states.dart';
import '../../../../../../core/custom_log.dart';
import '../../../logic/utils/level_controller.dart';


class QuotesCubit extends Cubit<QuoteStates>{
  QuotesCubit() : super(LoadingState());

  String? quoteBody;


  checkScore(AzureModel userInput) {

    List<Words>? words = userInput.nBest?.first.words;


    for(Words word in words!){
      Log.p("${word.word}");
      Log.p("${word.accuracyScore}");
      Log.p("_________");
    }

    if(words != null){

      List<Words> processedWords = ScoreController.processSentence(words, QuotesController.currentQuote);

      emit(ScoreState(userInput, processedWords));
    }
  }


  refresh(Level level) async {

    emit(LoadingState());

    LevelController.setLevel(level);

    quoteBody = await _getQuote();

    if(quoteBody != null) emit(ResponseState(quoteBody!));
  }


  static Future<String?> _getQuote(){

    switch (LevelController.level){

      case Level.beginner:
        return QuotesController.getShortQuote();

      case Level.intermediate:
        return QuotesController.getMediumQuote();

      case Level.advanced:
        return QuotesController.getLongQuote();
    }

  }


}
