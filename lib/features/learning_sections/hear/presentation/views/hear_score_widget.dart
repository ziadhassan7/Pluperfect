import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/score/score_controller.dart';
import 'package:pluperfect/features/learning_sections/common/score/score_widget.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_states.dart';
import '../../../../../core/azure_speech/azure_model.dart';


class HearScoreWidget extends StatelessWidget {
  const HearScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {

    HearStates state = context.watch<HearCubit>().state;

    if(state is ScoreState){

      AzureModel result = state.result;

      double pronScore = result.nBest!.first.pronScore!;
      double fluencyScore = result.nBest!.first.fluencyScore!;
      double accuracyScore = result.nBest!.first.accuracyScore!;

      int score = ScoreController.processFluencyScore(pronScore, fluencyScore,);

      return ScoreWidget(score: score,);
    }

    return const SizedBox.shrink();
  }


}