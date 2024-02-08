import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import '../../../../../core/azure_speech/azure_model.dart';
import '../cubit/quotes/quote_states.dart';
import '../cubit/quotes/quotes_cubit.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {

    QuoteStates state = context.watch<QuotesCubit>().state;

    if(state is ScoreState){

      AzureModel result = state.result;

      double pronScore = result.nBest!.first.pronScore!;
      double fluencyScore = result.nBest!.first.fluencyScore!;
      double accurateScore = result.nBest!.first.accuracyScore!;

      //This is so harsh on the user
      int score = processScore(pronScore, fluencyScore, accurateScore);


      return TextView("Your Score: $score%");
    }

    return const SizedBox.shrink();
  }


  int processScore(double pronScore, double fluencyScore, double accurateScore){
    double score = ((pronScore + fluencyScore)/200)*100;

    double accuracy = 100-accurateScore;

    double result = score - accuracy;

    if(result > 0){
      return result.ceil();

    } else {
      return 0;
    }
  }
}


///Documentation:

/*

//This is so harsh on the user
int score = processScore(pronScore, fluencyScore, accurateScore);  //Chosen <--

//This gives high score
int score2 = (((pronScore + fluencyScore + accurateScore)/300)*100).ceil();

//This is a little kinder
int score3 = lowestOfThree(pronScore, fluencyScore, accurateScore);

*/


/*
int lowestOfThree(double a, double b, double c) {
  return min(min(a, b), c).ceil();
}
*/

