import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/azure_speech/azure_model.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import 'package:pluperfect/features/learning_sections/common/sentence_controller.dart';
import '../../../../common/speaker_widget/util/speaker_controller.dart';
import 'hear_states.dart';


class HearCubit extends Cubit<HearStates>{
  HearCubit() : super(LoadingState());

  String? quoteBody;

  checkScore(AzureModel userInput){
    List<Words>? words = userInput.nBest?.first.words;

    if(words != null){

      List<Words> processedWords = SentenceController.processCorrectWords(words, QuotesController.currentQuote!);

      emit(ScoreState(userInput, processedWords));
    }
  }

  refresh() async {

    emit(LoadingState());

    String? quote = await QuotesController.getShortQuote();

    if(quote != null){
      await SpeakerController.speak(QuotesController.currentQuote)
          .then((tts) => emit(SpeakingState(quote)));

      SpeakerController.onComplete(_toggleSpeakerStateToNormal);
    }

  }


  _toggleSpeakerStateToNormal(){
    emit(const IdleState());
  }

}
