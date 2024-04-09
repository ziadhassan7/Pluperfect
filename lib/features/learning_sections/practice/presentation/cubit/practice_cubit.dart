import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/common/sentence_controller.dart';
import '../../../common/level_controller.dart';
import 'practice_states.dart';



enum PracticeSection{
  quote,
  hear,
}


class PracticeCubit extends Cubit<PracticeStates>{
  PracticeCubit() : super(LoadingState());


  refresh(Level level, {required PracticeSection section}) async {

    LevelController.setLevel(level);

    emit(LoadingState());

    switch(section){

      case PracticeSection.quote:
        String? quoteBody = await _getQuote();
        if(quoteBody != null) emit(QuoteState(quoteBody));

        break;

      case PracticeSection.hear:
        String? quoteBody = await _getQuote();
        if(quoteBody != null) emit(HearState(quoteBody)); //HearState

        break;
    }

  }


  checkScore(AzureModel userInput, {required PracticeSection section}) {

    _checkQuoteScore(userInput);

  }


  _checkQuoteScore(AzureModel userInput) {

    List<Words>? words = userInput.nBest?.first.words;

    if(words != null){

      List<Words> processedWords = SentenceController.processCorrectWords(words, QuotesController.currentQuote!);
      emit(QuoteScoreState(userInput, processedWords));
    }
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
