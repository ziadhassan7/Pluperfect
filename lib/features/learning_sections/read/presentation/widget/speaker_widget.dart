import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/constants/colors.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/speaker/speak_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/speaker/speaker_states.dart';


class SpeakerWidget extends StatelessWidget {
  const SpeakerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeakerCubit, SpeakerStates>(
      builder: (_, state) {

        // Idle
        if(state is IdleState){
          return IconButton(
            onPressed: () async => await context.read<SpeakerCubit>().speak(),

            icon: const Icon(Icons.volume_up_rounded, color: black, size: 28,),
          );
        }

        // Speaking
        if (state is SpeakingState) {
          return IconButton(
            onPressed: () async => await context.read<SpeakerCubit>().stop(),

            icon: const Icon(Icons.stop, color: black, size: 28,),
          );
        }

      // else: Loading
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
