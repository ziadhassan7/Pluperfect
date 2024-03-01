import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/cubit/speaker_states.dart';
import '../util/speaker_controller.dart';


class SpeakerCubit extends Cubit<SpeakerStates>{
  SpeakerCubit() : super(IdleState());

  speak(String? text) async {

    emit(LoadingState());

    await SpeakerController.speak(text)
        .then((tts) => emit(SpeakingState()));

    SpeakerController.onComplete(_toggleSpeakerStateToNormal);
  }

  stop() async {
    await SpeakerController.stop()
        .then((tts) => _toggleSpeakerStateToNormal());
  }

  _toggleSpeakerStateToNormal(){
    emit(IdleState());
  }

}