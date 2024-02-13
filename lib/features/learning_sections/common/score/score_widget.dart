import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';


class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key, required this.score,});

  final int score;

  @override
  Widget build(BuildContext context) {


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

