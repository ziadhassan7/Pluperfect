import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/features/learning_sections/common/score/score_widget.dart';
import '../../../../../core/azure_speech/azure_model.dart';
import '../../../common/score/score_controller.dart';
import '../cubit/quotes/quote_states.dart';
import '../cubit/quotes/quote_cubit.dart';


class ReadScoreWidget extends StatelessWidget {
  const ReadScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {

    QuoteStates state = context.watch<QuoteCubit>().state;

    if(state is ScoreState){

      AzureModel result = state.result;

      double pronScore = result.nBest!.first.pronScore!;
      double fluencyScore = result.nBest!.first.fluencyScore!;
      double accuracyScore = result.nBest!.first.accuracyScore!;

      int score = ScoreController.processOverallScore(pronScore, fluencyScore, accuracyScore);

      return ScoreWidget(score: score,);
    }

    return const SizedBox.shrink();
  }


}