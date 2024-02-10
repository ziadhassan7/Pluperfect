import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/score_widget.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import 'package:pluperfect/features/learning_sections/hear/presentation/cubit/hear/hear_states.dart';
import '../../../../../core/azure_speech/azure_model.dart';


class QuestionScoreWidget extends StatelessWidget {
  const QuestionScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {

    HearStates state = context.watch<HearCubit>().state;

    if(state is ScoreState){

      AzureModel result = state.result;

      double pronScore = result.nBest!.first.pronScore!;
      double fluencyScore = result.nBest!.first.fluencyScore!;
      double accuracyScore = result.nBest!.first.accuracyScore!;

      return ScoreWidget(
          pronScore: pronScore,
          fluencyScore: fluencyScore,
          accuracyScore: accuracyScore);
    }

    return const SizedBox.shrink();
  }


}