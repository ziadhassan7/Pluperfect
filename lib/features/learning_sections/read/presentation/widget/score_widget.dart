import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';
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


      return Padding(
        padding: const CustomPadding(vertical: 28, horizontal: 38),

        child: Row(
          children: [
            const TextView("Your Score is:", scale: TypeScale.headline2,),

            const Spacer(),

            CircularPercentIndicator(
              radius: 36.0,
              lineWidth: 10.0,
              percent: score/100,
              center: TextView("$score"),
              animation: true,
              animationDuration: 2500,
              progressColor: getIndicatorColor(score),
              circularStrokeCap: CircularStrokeCap.round,
            )
          ],
        ),
      );
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


  Color getIndicatorColor(int score){

    Color green = Colors.green;
    Color yellow = Colors.yellow;
    Color red = Colors.red;

    if(score > 80){
      return green;
    }

    if(score < 80 && score >=50){
      return yellow;
    }

    return red;
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

