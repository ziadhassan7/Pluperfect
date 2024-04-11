import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/features/learning_sections/common/words_handler/correct_words_processor.dart';
import '../../../common/level_controller.dart';
import '../../logic/quotes_provider/quotes_controller.dart';
import 'practice_states.dart';



enum PracticeSection{
  quote,
  hear,
}


class PracticeCubit extends Cubit<PracticeStates>{
  PracticeCubit() : super(LoadingState());


  checkScore(AzureModel userInput, {required PracticeSection section}) {

    List<Words>? words = userInput.nBest?.first.words;

    if(words != null){

      List<Words> processedWords = CorrectWordsProcessor.getScoredWords(words, QuotesController.currentQuote!);
      emit(ScoreState(userInput, processedWords));
    }

  }

  refresh({required PracticeSection section}) async {

    emit(LoadingState());

    switch(section){

      case PracticeSection.quote:
        _emitQuoteState();
        break;

      case PracticeSection.hear:
        _emitHearState();
        break;
    }

  }

  _emitQuoteState() async {
    try{
      String? quoteBody = await _getQuote();
      if (quoteBody != null) emit(QuoteState(quoteBody)); //QuoteState

    } catch(e){
      emit(ErrorState());
    }
  }

  _emitHearState() async {
    try{
      String? quoteBody = await _getQuote();
      if (quoteBody != null) emit(HearState(quoteBody)); //HearState

    } catch(e){
      emit(ErrorState());
    }
  }



  Future<String?> _getQuote(){
    try {
      switch (LevelController.level) {
        case Level.beginner:
          return QuotesController.getShortQuote();

        case Level.intermediate:
          return QuotesController.getMediumQuote();

        case Level.advanced:
          return QuotesController.getLongQuote();
      }


    } catch (e) {
      rethrow;
    }
  }


}
