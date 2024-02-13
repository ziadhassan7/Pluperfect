import 'package:flutter/material.dart';
import 'package:pluperfect/core/app_widgets/text_view/text_view.dart';
import 'package:pluperfect/core/styles/padding.dart';

import 'circular_score_indicator.dart';


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

          CircularScoreIndicator(score: score,),
        ],
      ),
    );
  }

}

