import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/hear_user_input_controller.dart';
import 'package:pluperfect/features/learning_sections/common/steps_widget/cubit/steps_cubit.dart';
import '../../../core/record_audio/recorder_client.dart';
import 'speaker_widget/util/speaker_controller.dart';
import 'context_menu/context_menu.dart';

class ClosePageController {

  static exit(BuildContext context, ){
    //close any context menu opened
    closeContextMenu();
    //reset the steps
    resetPageSteps(context);
    //stop any opened speakers
    closeAnyOpenedAudio();
  }

  static closeContextMenu(){
    ContextMenu.close();
  }

  static resetPageSteps(BuildContext context){
    context.read<StepsCubit>().reset();
  }

  static closeAnyOpenedAudio(){
    SpeakerController.stop();
    HearUserInputController.stop();
    RecorderClient.stop();
  }

}