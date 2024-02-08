import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/speaker/speaker_states.dart';
import '../../../logic/utils/speaker_controller.dart';


class SpeakerCubit extends Cubit<SpeakerStates>{
  SpeakerCubit() : super(IdleState());

  speak() async {

    emit(LoadingState());

    await SpeakerController.speak()
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