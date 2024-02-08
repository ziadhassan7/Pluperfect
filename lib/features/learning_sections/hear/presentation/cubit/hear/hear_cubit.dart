import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import '../../../../read/logic/utils/speaker_controller.dart';
import 'hear_states.dart';


class HearCubit extends Cubit<HearStates>{
  HearCubit() : super(LoadingState());

  String? quoteBody;

  score(){

  }

  refresh() async {

    emit(LoadingState());

    String? quote = await QuotesController.getShortQuote();

    if(quote != null){
      await SpeakerController.speak()
          .then((tts) => emit(SpeakingState(quote)));

      SpeakerController.onComplete(_toggleSpeakerStateToNormal);
    }

  }


  _toggleSpeakerStateToNormal(){
    emit(const IdleState());
  }

}
