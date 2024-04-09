import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import '../../../../core/app_widgets/text_view/text_view.dart';

class CircularScoreIndicator extends StatelessWidget {
  const CircularScoreIndicator({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 36.0,
      lineWidth: 10.0,
      percent: score/100,
      center: TextView("$score"),
      animation: true,
      animationDuration: 2500,
      progressColor: getIndicatorColor(score),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  Color getIndicatorColor(int score){

    Color green = Colors.green;
    Color yellow = ColorTheme.yellow;
    Color red = Colors.red;

    if(score > 80){
      return green;
    }

    if(score <= 80 && score >=50){
      return yellow;
    }

    return red;
  }
}
