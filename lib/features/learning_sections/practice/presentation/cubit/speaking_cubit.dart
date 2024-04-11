import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/speaker_widget/util/speaker_controller.dart';
import '../../logic/quotes_provider/quotes_controller.dart';


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
