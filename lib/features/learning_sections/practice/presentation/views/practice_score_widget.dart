import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_cubit.dart';
import 'package:pluperfect/features/learning_sections/practice/presentation/cubit/practice_states.dart';
import 'package:pluperfect/features/learning_sections/common/score/score_widget.dart';
import '../../../../../core/app_widgets/text_view/text_view.dart';
import '../../../../../core/azure_speech/azure_model.dart';
import '../../../common/score/circular_score_indicator.dart';
import '../../../common/score/score_controller.dart';


class PracticeScoreWidget extends StatelessWidget {
  const PracticeScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const CustomPadding(vertical: 20),

      child: BlocBuilder<PracticeCubit, PracticeStates>(
          builder: (context, state){
            if(state is QuoteScoreState){

              AzureModel result = state.result;

              return quoteScoreWidget(result);
            }

            return const SizedBox.shrink();
          }
      ),
    );
  }


  Widget quoteScoreWidget(AzureModel result){
    double pronScore = result.nBest!.first.pronScore!;
    double fluencyScore = result.nBest!.first.fluencyScore!;
    double accuracyScore = result.nBest!.first.accuracyScore!;

    int score = ScoreController.processOverallScore(pronScore, fluencyScore, accuracyScore);

    return ScoreWidget(score: score,);
  }

  Widget questionScoreWidget(int grammarScore, double pronScore){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularScoreIndicator(score: (grammarScore*10),),
            const TextView("Grammar Score", scale: TypeScale.small,),
          ],
        ),


        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularScoreIndicator(score: pronScore.ceil(),),
            const TextView("Pronunciation Score", scale: TypeScale.small,),
          ],
        ),
      ],
    );
  }


}