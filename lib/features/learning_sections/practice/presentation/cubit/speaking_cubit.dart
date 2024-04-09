import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/quotes_provider/quotes_controller.dart';
import '../../../common/speaker_widget/util/speaker_controller.dart';


class SpeakingCubit extends Cubit<bool>{
  SpeakingCubit() : super(false);


  speak(String quote) async {

    await SpeakerController.speak(QuotesController.currentQuote)
        .then((tts) => emit(true));

    SpeakerController.onComplete(_toggleSpeakerStateToNormal);

  }


  _toggleSpeakerStateToNormal(){
    emit(false);
  }

}
