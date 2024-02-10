import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key, required this.pronScore, required this.fluencyScore, required this.accuracyScore});

  final double pronScore;
  final double fluencyScore;
  final double accuracyScore;

  @override
  Widget build(BuildContext context) {

    int score = processScore(pronScore, fluencyScore, accuracyScore);

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

