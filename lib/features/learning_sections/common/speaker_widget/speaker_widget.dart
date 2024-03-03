import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/cubit/speak_cubit.dart';
import 'package:pluperfect/features/learning_sections/common/speaker_widget/cubit/speaker_states.dart';
import '../../../../core/localization/localization.dart';

//ignore: must_be_immutable
class SpeakerWidget extends StatelessWidget {
  SpeakerWidget({super.key, this.text, this.color, this.size});

  final String? text;
  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {

    color ??= ColorTheme.text;

    return BlocBuilder<SpeakerCubit, SpeakerStates>(
      builder: (_, state) {

        // Idle
        if(state is IdleState){
          return IconButton(
            onPressed: () async => await context.read<SpeakerCubit>().speak(text),

            icon: Icon(Icons.volume_up_rounded,
              semanticLabel: LocalTxt.translateButton, color: color, size: size ?? 28,),
          );
        }

        // Speaking
        if (state is SpeakingState) {
          return IconButton(
            onPressed: () async => await context.read<SpeakerCubit>().stop(),

            icon: Icon(Icons.stop, color: color, size: size ?? 28,),
          );
        }

      // else: Loading
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
